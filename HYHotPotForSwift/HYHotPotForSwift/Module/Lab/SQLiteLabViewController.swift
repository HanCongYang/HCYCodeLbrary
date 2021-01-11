//
//  SQLiteLabViewController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/25.
//

import UIKit
import SQLite

class SQLiteLabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        print(docsDir)

        let db = try! Connection("\(docsDir)/db.sqlite3")

        let users = Table("users")
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")

        try! db.run(users.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email, unique: true)
        })

        // CREATE TABLE "users" (
        //     "id" INTEGER PRIMARY KEY NOT NULL,
        //     "name" TEXT,
        //     "email" TEXT NOT NULL UNIQUE
        // )

        let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
        let rowid = try! db.run(insert)
        // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')

        for user in try! db.prepare(users) {
            print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            // id: 1, name: Optional("Alice"), email: alice@mac.com
        }
        // SELECT * FROM "users"

        let alice = users.filter(id == rowid)

        try! db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
        // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
        // WHERE ("id" = 1)

        try! db.run(alice.delete())
        // DELETE FROM "users" WHERE ("id" = 1)

        try! db.scalar(users.count) // 0
        // SELECT count(*) FROM "users"
        
    }

}

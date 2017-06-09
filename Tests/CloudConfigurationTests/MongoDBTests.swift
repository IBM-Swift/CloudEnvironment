/*
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XCTest
import Configuration
@testable import CloudConfiguration

class MongoDBTests: XCTestCase {

    static var allTests : [(String, (MongoDBTests) -> () throws -> Void)] {
        return [
            ("testGetCredentials", testGetCredentials),
        ]
    }

    func testGetCredentials() {

        let manager = ConfigurationManager()

        // Modify relative path for your system, make more dynamic later
        let filePath = URL(fileURLWithPath: #file).appendingPathComponent("../config_example.json").standardized
        manager.load(url: filePath)

        guard let credentials =  manager.getMongoDBCredentials(name: "MongoDBService") else {
            XCTFail("Could not load MongoDB credentials.")
            return
        }

        XCTAssertEqual(credentials.host, "bluemix-sandbox-dal-9-portal.4.dblayer.com", "MongoDB service host should match.")
        XCTAssertEqual(credentials.username, "username", "MongoDB service username should match.")
        XCTAssertEqual(credentials.password, "password", "MongoDB service password should match.")
        XCTAssertEqual(credentials.port, 19889, "MongoDB service port should match.")
        XCTAssertEqual(credentials.certificate, "certificateString", "MongoDB service certificate should match.")

    }
    
}

// Copyright (c) 2010-2022 Contributors to the openHAB project
//
// See the NOTICE file(s) distributed with this work for additional
// information.
//
// This program and the accompanying materials are made available under the
// terms of the Eclipse Public License 2.0 which is available at
// http://www.eclipse.org/legal/epl-2.0
//
// SPDX-License-Identifier: EPL-2.0

@testable import OpenHABCore
import XCTest

class OpenHABUserDefaultsTests: XCTestCase {
    let data = UserDefaults(suiteName: "group.es.spaphone.openhab")!

    override func setUp() {
        super.setUp()
        let defaultsName = Bundle.main.bundleIdentifier!
        data.removePersistentDomain(forName: defaultsName)

        Preferences.username = Preferences.username
        Preferences.localUrl = Preferences.localUrl
        Preferences.remoteUrl = Preferences.remoteUrl
        Preferences.password = Preferences.password
        Preferences.ignoreSSL = Preferences.ignoreSSL
        Preferences.demomode = Preferences.demomode
        Preferences.idleOff = Preferences.idleOff
        Preferences.iconType = Preferences.iconType
        Preferences.defaultSitemap = Preferences.defaultSitemap
    }

    // Testing the consistency between properties of Preferences and the corresponding entry in UserDefaults
    func testConsistency() {
        XCTAssertEqual(Preferences.username, data.string(forKey: "username"))
        XCTAssertNotEqual(Preferences.username, data.string(forKey: "usern"))
        XCTAssertEqual(Preferences.localUrl, data.string(forKey: "localUrl"))
        XCTAssertEqual(Preferences.remoteUrl, data.string(forKey: "remoteUrl"))
        XCTAssertEqual(Preferences.password, data.string(forKey: "password"))
        XCTAssertEqual(Preferences.ignoreSSL, data.bool(forKey: "ignoreSSL"))
        //  XCTAssertEqual(Preferences.sitemapName, data.string(forKey: "sitemapName"))
        XCTAssertEqual(Preferences.demomode, data.bool(forKey: "demomode"))
        XCTAssertEqual(Preferences.idleOff, data.bool(forKey: "idleOff"))
        XCTAssertEqual(Preferences.iconType, data.integer(forKey: "iconType"))
        XCTAssertEqual(Preferences.defaultSitemap, data.string(forKey: "defaultSitemap"))
    }
}

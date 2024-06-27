//
//  OnboardingModel.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 25/04/24.
//

import Foundation

struct SlidingData: Identifiable, Hashable {
    var icon: String
    var title: String
    var description: String
    var id = UUID()
    
    static func perview() -> [SlidingData] {
        [SlidingData(icon: "cart", title: "Launch your Classifieds Marketplace", description: "Take advantage of our amazing template to launch your iOS app Today")]
       // [SlidingData(icon: "cart", title: "Launch your Classifieds Marketplace", description: "Take advantage of our amazing template to launch your iOS app Today"), SlidingData(icon: "map", title: "Map View", description: "Visualise listing on the map to make your search easier"), SlidingData(icon: "heart", title: "Saved Places", description: "Save the listing you like so you can come back to them later"), SlidingData(icon: "binoculars", title: "Advanced Filters", description: "Search by as many filters as you’d like"), SlidingData(icon: "bell", title: "Push Notifications", description: "Receive notification with new postings, promotions or reminders."), SlidingData(icon: "note.text.badge.plus", title: "Post Your Classifieds", description: "Allow any user to post their own classified listings.")]
    }
}

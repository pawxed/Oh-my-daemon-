#!/bin/bash
set -e

disable_daemon() {
  launchctl bootout "system/$1" || true
}

# originally i got this script from @dyld in discord which is something that just bootout useless daemon that might drain your battery, i personally modified it to what i need. what makes this different from my "Oh my daemon" disabled.plist is that this is just bootout command instead of entirely stopping them from disabled.plist

# --- ML / on-device analysis / indexing (highest impact on this hardware) ---
disable_daemon com.apple.photoanalysisd
disable_daemon com.apple.mediaanalysisd
disable_daemon com.apple.mediaanalysisd.service
disable_daemon com.apple.knowledgeconstructiond
disable_daemon com.apple.duetexpertd
disable_daemon com.apple.coreduetd
disable_daemon com.apple.contextstored
disable_daemon com.apple.proactiveeventtrackerd
disable_daemon com.apple.ospredictiond
disable_daemon com.apple.spotlight.IndexAgent
disable_daemon com.apple.spotlightknowledged
disable_daemon com.apple.mlmodelingd
disable_daemon com.apple.mlruntimed
disable_daemon com.apple.momentsd
disable_daemon com.apple.routined

# --- Apple telemetry / analytics / ads (not local logging, just phones home) ---
disable_daemon com.apple.analyticsd
#disable_daemon com.apple.aggregated
# i disabled aggregated to keep track of my battery usage in settings, feel free to turn it remove the hashtag if you want to turn if off
disable_daemon com.apple.aggregated.addaily
disable_daemon com.apple.awdd
disable_daemon com.apple.osanalytics.osanalyticshelper
disable_daemon com.apple.perfdiagsselfenabled
disable_daemon com.apple.wifianalyticsd
disable_daemon com.apple.rtcreportingd
disable_daemon com.apple.privacyaccountingd
disable_daemon com.apple.anomalydetectiond
disable_daemon com.apple.ap.adprivacyd
disable_daemon com.apple.ap.promotedcontentd

# --- Xcode wireless debugging / Tips app ---
disable_daemon com.apple.dt.AutomationModeUI
disable_daemon com.apple.dt.automationmode-writer
disable_daemon com.apple.dt.fetchsymbolsd
disable_daemon com.apple.dt.previewsd
disable_daemon com.apple.dt.remotepairingdeviced
disable_daemon com.apple.tipsd

# --- Apple Watch companion stack (no watch) ---
disable_daemon com.apple.companion_proxy
disable_daemon com.apple.companionauthd
disable_daemon com.apple.nanobackupd
disable_daemon com.apple.nanoprefsyncd
disable_daemon com.apple.nanoregistryd
disable_daemon com.apple.nanoregistrylaunchd
disable_daemon com.apple.nanotimekitcompaniond
disable_daemon com.apple.watchlistd
disable_daemon com.apple.watchpresenced

# --- Siri / on-device assistant / speech ---
disable_daemon com.apple.assistantd
disable_daemon com.apple.assistant_service
disable_daemon com.apple.assistant_cdmd
disable_daemon com.apple.siriactionsd
disable_daemon com.apple.siriinferenced
disable_daemon com.apple.siriknowledged
disable_daemon com.apple.sirittsd
disable_daemon com.apple.corespeechd
disable_daemon com.apple.speechmodeltrainingd
disable_daemon com.apple.naturallanguaged
disable_daemon com.apple.translationd

# --- HomeKit ---
disable_daemon com.apple.homed

# i disabled those two cause it breaks app store when i tried to purchase a new app, even if it was free from what i tested though, i was using iOS 16.7.X so I'm not sure if this applies to other version

# --- Wallet / Apple Pay / NFC ---
#disable_daemon com.apple.passd
#disable_daemon com.apple.financed
disable_daemon com.apple.nfcd

# --- Game Center ---
disable_daemon com.apple.gamed
disable_daemon com.apple.GameController.gamecontrollerd

# --- Health / Fitness ---
disable_daemon com.apple.healthd
disable_daemon com.apple.healthappd
disable_daemon com.apple.healthrecordsd
disable_daemon com.apple.fitcore
disable_daemon com.apple.fitcore.session
disable_daemon com.apple.fitnesscoachingd
disable_daemon com.apple.activityawardsd

# --- CarPlay ---
disable_daemon com.apple.CarPlayApp
disable_daemon com.apple.carkitd

# --- News / Sports (Weather kept alive) ---
disable_daemon com.apple.newsd
disable_daemon com.apple.sportsd

# --- Find My offline network (AirTag-style mesh finding, not core Find My iPhone) ---
disable_daemon com.apple.icloud.searchpartyd

# --- Accessibility extras (assistivetouchd kept alive) ---
disable_daemon com.apple.accessibility.axassetsd
disable_daemon com.apple.accessibility.axremoted
disable_daemon com.apple.accessibility.heard
disable_daemon com.apple.accessibility.motiontrackingd
disable_daemon com.apple.VoiceOverTouch

# additional stuff i added myself
disable_daemon com.apple.UsageTrackingAgent
disable_daemon com.apple.hangreporter
disable_daemon com.apple.suggestd
disable_daemon com.apple.sysdiagnose_helper
disable_daemon com.apple.hangtracerd
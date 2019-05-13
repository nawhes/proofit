configtxgen -profile Account -channelID account -outputAnchorPeersUpdate=appAnchorPeerAccount.tx -asOrg=app
configtxgen -profile Proofit -channelID proofit -outputAnchorPeersUpdate=appAnchorPeerProofit.tx -asOrg=app
configtxgen -profile Univ -channelID univ -outputAnchorPeersUpdate=appAnchorPeerUniv.tx -asOrg=app
configtxgen -profile License -channelID license -outputAnchorPeersUpdate=appAnchorPeerLicense.tx -asOrg=app
configtxgen -profile Language -channelID language -outputAnchorPeersUpdate=appAnchorPeerLanguage.tx -asOrg=app

configtxgen -profile Proofit -channelID proofit -outputAnchorPeersUpdate=recruitAnchorPeerProofit.tx -asOrg=recruit

configtxgen -profile Account -channelID account -outputAnchorPeersUpdate=univAnchorPeerAccount.tx -asOrg=univ
configtxgen -profile Univ -channelID univ -outputAnchorPeersUpdate=univAnchorPeerUniv.tx -asOrg=univ
configtxgen -profile Proofit -channelID proofit -outputAnchorPeersUpdate=univAnchorPeerProofit.tx -asOrg=univ


configtxgen -profile Account -channelID account -outputAnchorPeersUpdate=licenseAnchorPeerAccount.tx -asOrg=license
configtxgen -profile License -channelID license -outputAnchorPeersUpdate=licenseAnchorPeerLicense.tx -asOrg=license
configtxgen -profile Proofit -channelID proofit -outputAnchorPeersUpdate=licenseAnchorPeerProofit.tx -asOrg=license

configtxgen -profile Account -channelID account -outputAnchorPeersUpdate=languageAnchorPeerAccount.tx -asOrg=language
configtxgen -profile Language -channelID language -outputAnchorPeersUpdate=languageAnchorPeerLanguage.tx -asOrg=language
configtxgen -profile Proofit -channelID proofit -outputAnchorPeersUpdate=languageAnchorPeerProofit.tx -asOrg=language

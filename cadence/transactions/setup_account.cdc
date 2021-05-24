
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import PeekToken from "../contracts/PeekToken.cdc"

// This transaction configures an account to hold Kitty Items.

transaction {
    prepare(signer: AuthAccount) {
        // if the account doesn't already have a collection
        if signer.borrow<&PeekToken.Collection>(from: PeekToken.CollectionStoragePath) == nil {

            // create a new empty collection
            let collection <- PeekToken.createEmptyCollection()

            // save it to the account
            signer.save(<-collection, to: PeekToken.CollectionStoragePath)

            // create a public capability for the collection
            signer.link<&PeekToken.Collection{NonFungibleToken.CollectionPublic, PeekToken.PeekTokenCollectionPublic}>(PeekToken.CollectionPublicPath, target: PeekToken.CollectionStoragePath)
        }
    }
}
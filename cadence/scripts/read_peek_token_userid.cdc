import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import PeekToken from "../contracts/PeekToken.cdc"

// This script returns the metadata for an NFT in an account's collection.


pub fun main(address: Address, tokenID: UInt64): String {

    // get the public account object for the token owner
    let owner = getAccount(address)

    let collectionBorrow = owner.getCapability(PeekToken.CollectionPublicPath)!
        .borrow<&{PeekToken.PeekTokenCollectionPublic}>()
        ?? panic("Could not borrow PeekTokenCollectionPublic")

    // borrow a reference to a specific NFT in the collection
    let peekToken = collectionBorrow.borrowPeekToken(id: tokenID)
        ?? panic("No such itemID in that collection")

    return peekToken.userUUID
}
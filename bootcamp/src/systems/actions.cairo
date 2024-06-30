
// define the interface
#[dojo::interface]
trait IActions {
    fn spawn();
    fn paint(x: u16,y: u16, color: felt252);
}


#[dojo::contract]
mod actions {
    use super::{IActions};
    use starknet::{ContractAddress, get_caller_address, get_block_timestamp};
    use bootcamp::models::{tile::{Tile}, player::{Player}};

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn spawn(world: IWorldDispatcher) {
            // Get the address of the current caller, possibly the player's address.
            let address = get_caller_address();
            // Retrieve the player's current position from the world.
            let player = world.uuid();

            let  existing_player = get!(world, (address), Player);

            assert(existing_player.last_action == 0, 'ACTIONS: player already exists');

            let last_action = get_block_timestamp();

            set!(world, Player {address, player, last_action});
        }

        fn paint(world: IWorldDispatcher, x: u16 , y: u16, color: felt252){
            let address = get_caller_address();

            let  player = get!(world,(address), Player);

            assert(player.address == address, 'ACTIONS: not Player');

            set!(world, Tile{x,y,color});
        }
    }
}


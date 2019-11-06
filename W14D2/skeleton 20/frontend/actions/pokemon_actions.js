import * as APIUtil from '../util/api_util.js';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON, 
  pokemon 
});

export const receiveOnePokemon = payload => ({
  type: RECEIVE_ONE_POKEMON, 
  poke: payload.pokemon, 
  items: payload.items
});

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestOnePokemon = (id) => (dispatch) => {
  ApiUtil.fetchOnePokemon(id)
    .then(response => dispatch(receiveOnePokemon(response)))
};
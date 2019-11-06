import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = ({pokemon}) => {
  return (
    <li>
      <Link to="/pokemon/:pokemonId">
        <p>{pokemon.name}</p>
        <img src={pokemon.image_url} width="30px" height="30px" />
      </Link> 
    </li>
  )
}

export default PokemonIndexItem; 

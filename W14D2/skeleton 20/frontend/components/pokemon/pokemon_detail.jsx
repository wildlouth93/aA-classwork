import React from 'react';



class PokemonDetail extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount(e) {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  render() {
    return <p>Pokemon Detail</p>
  }
}


export default PokemonDetail; 
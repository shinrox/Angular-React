ReactComponents = ReactComponents || {}
ReactFactories = ReactFactories || {}
ReactHelpers = ReactHelpers || {}

ReactHelpers.pluralize = (number)->
  return if number > 1 or number is 0 then 'ns' else 'm'


ReactComponents.ChildComponent = React.createClass {
    displayName: 'ChildComponent'
    getDefaultProps: ()->
      return {
        quantity: 0
      }

    handleUpdate: ->
      @props.update()

    render: ->
      <div className="child-component">
        <h2>Segundo Componente (Child)</h2>
        <p>Array contém {@props.quantity} ite{ReactHelpers.pluralize(@props.quantity)}</p>
        <button onClick={@handleUpdate}>Change</button>

      </div>
  }


ReactComponents.ParentComponent = React.createClass {
    displayName: 'ParentComponent'
    getInitialState: ()->
      return {
        value: 0
        action: 0
      }

    getDefaultProps: ()->
      return {
        value: 0
        action: 0
      }

    changed: ->
      @props.changed?(@state)
      return

    updateValue: ->
      @state.value = Math.floor(Math.random()*(10-0+1))
      @setState(@state)
      @changed()

    propTypes:
      changed: React.PropTypes.func.isRequired

    render: ->
      <div className="parent-component">
        <h2>Primeiro Componente (Parent)</h2>
        {<p key={n}>Item {n} no Array</p> for n in [1..@state.value] if @state.value > 0}
        <ReactComponents.ChildComponent quantity={@state.value} update={@updateValue}/>

      </div>

    componentWillReceiveProps: (props)->
      @setState(props)

  }

ReactFactories.ParentComponent = React.createFactory(ReactComponents.ParentComponent)


























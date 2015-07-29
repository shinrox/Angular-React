# Angular-React
Angular + React


## Uso simples do React com Angular (ou outros frameworks)##



### Dependências principais (relacionadas ao React) ###


- Npm
```js
{
  "coffee-react": "^4.0.0", \\ para uso do react como coffee (.cjsx)
  "gulp-cjsx": "^3.0.0", \\ wrapper para criar task do gulp usando o coffee-react
}
```


- Bower
```js
{
  "react": "~0.13.3", \\ dãh
}
```

### Angular

```coffee
  # src/app/components/testDirect/controller.coffee

angular.module "HolmesAngularReact.controllers"
.controller "TestDirectiveCtrl", ($scope, $element) ->
  ##################################
  ## Init
  ##################################


  # function passed to React Component to be called when something changed internally by the component
  $scope.changed = (state)->
    $.extend true, $scope, state
    $scope.$apply()

  # Render on directive load
  React.render ReactFactories.ParentComponent($scope), $element[0]

  $scope.$watch 'value', (v1, v2)->
    # Re-render after model has changed from interaction inside angular
    React.render ReactFactories.ParentComponent($scope), $element[0]




```


### React

```coffee
# src/app/components/react/components.cjsx

ReactComponents = ReactComponents || {}
ReactFactories = ReactFactories || {}
ReactHelpers = ReactHelpers || {}

#ternary like comparison externalized
ReactHelpers.pluralize = (number)->
  return if number > 1 or number is 0 then 'ns' else 'm'


ReactComponents.ChildComponent = React.createClass {
    displayName: 'ChildComponent'
    getDefaultProps: ()->
      return {
        quantity: 0
      }

    # bound to onClick event and calls the fn passed on the attribute
    handleUpdate: ->
      @props.update?()

    render: ->
      <div className="child-component">
        <h2>Segundo Componente (Child)</h2>
        <p>
          Array contém {@props.quantity}
          ite{ReactHelpers.pluralize(@props.quantity)} # can only to use ternary comparison externalized
        </p>
        <button onClick={@handleUpdate}>Change</button>

      </div>
  }


ReactComponents.ParentComponent = React.createClass {
    displayName: 'ParentComponent'
    getInitialState: ()->
      return {
        value: 0
      }

    #internal changed function that calls the property bound on external framework
    changed: ->
      @props.changed?(@state)
      return

    #function that updates the internal state and calls @changed
    updateValue: ->
      @state.value = Math.floor(Math.random()*(10-0+1))
      @setState(@state)
      @changed()

    propTypes:
      changed: React.PropTypes.func

    render: ->
      <div className="parent-component">
        <h2>Primeiro Componente (Parent)</h2>
        {<p key={n}>Item {n} no Array</p> for n in [1..@state.value] if @state.value > 0}
        <ReactComponents.ChildComponent quantity={@state.value} update={@updateValue}/>

      </div>

    # called on React.render(Component(...))
    componentWillReceiveProps: (props)->
      @setState(props)

  }


# wrap classes with factory to use as Function with React.render(Component(), element) https://gist.github.com/sebmarkbage/ae327f2eda03bf165261
ReactFactories.ParentComponent = React.createFactory(ReactComponents.ParentComponent)




```








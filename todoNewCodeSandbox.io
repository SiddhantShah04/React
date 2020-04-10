import React from "react";
import { render } from "react-dom";

let id = 0;
const Todo = porps => {
  return (
    <li>
      <input
        type="checkbox"
        checked={porps.todo.checked}
        onChange={porps.onToggle}
      />
      <button onClick={porps.onDelete}> delete </button>
      <span>{porps.todo.text}</span>
    </li>
  );
};

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      todo: []
    };
  }
  toggled(text) {
    this.setState({
      todo: this.state.todo.map(todo => {
        if (todo.text !== text) return todo;
        return {
          text: todo.text,
          checked: !todo.checked
        };
      })
    });
  }
  delete(text) {
    this.setState({
      todo: this.state.todo.filter(todo => todo.text !== text)
    });
  }
  addTodo() {
    const text = prompt("Todo text please");
    this.setState({
      todo: [...this.state.todo, { id: id++, text: text, checked: false }]
    });
  }

  render() {
    return (
      <div>
        <div>Todo count:{this.state.todo.length}</div>
        <div>
          Unchecked todo count:
          {
            //something important is here
            this.state.todo.filter(todo => !todo.checked).length
          }
        </div>
        <button onClick={() => this.addTodo()}>add Todo</button>
        <ul>
          {this.state.todo.map(todo => (
            //something important is here
            <Todo
              onDelete={() => this.delete(todo.text)}
              onToggle={() => this.toggled(todo.text)}
              todo={todo}
            />
          ))}
        </ul>
      </div>
    );
  }
}

render(<App />, document.getElementById("root"));

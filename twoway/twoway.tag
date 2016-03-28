<twoway>
  
  <h3>Example Two-Way Binding</h3>

  <input onkeyup={ keyup } />

  <div class={ show: data }>{ data }</div>

  keyup(e) {
    this.data = e.target.value
  }

</twoway>
<todo>
  
  <h3>{ opts.title }</h3>

  <ul>
    <li each={ item, i in items }>
      <label class={ completed: done }>
        <input type="checkbox" checked={ done } onclick={ parent.toggle }> { item.title }
      </label>
      <span onclick={ delete }>x</span>
    </li>
  </ul>

  <form onsubmit={ add }>
    <input name="input" onkeyup={ edit }>
    <button disabled={ !text }>Add #{ items.length + 1 }</button>
  </form>

  <script>
    this.disabled = true

    this.items = opts.items

    edit(e) {
      this.text = e.target.value
    }

    add(e) {
      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.input.value = ''
      }
    }

    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    delete(e) {
      // way 1 [splice] know index
      var index = e.item.i
      this.items.splice(index, 1)

      // way 2 [filter] don't know index
      var _items = this.items
      var _title = e.item.item.title
      var temp = _items.filter(function(i) {
        return i.title != _title
      })
      this.items = temp

      // way 3 [forloop] don't know index
      for(var i = _items.length-1; i--;)
        if (_items[i].title === _title) this.items.splice(i, 1)
    }
  </script>

</todo>

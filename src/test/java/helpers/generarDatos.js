function fn() {

  var timestamp = new Date().getTime();

  var usuario = {
    nome: 'Usuario QA ' + timestamp,
    email: 'qa' + timestamp + '@test.com',
    password: 'teste123',
    administrador: 'true'
  };

  return usuario;
}
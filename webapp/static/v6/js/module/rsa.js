define(function(require, exports, module){
    var JSEncrypt = require('jsencrypt').JSEncrypt;
    var PUBLICKEY = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCW0Cotn0F+d+Qin6T4+eb1LH898XzR15kjS6JOzDyAZy3mrJ5YeUXI9kPcN/6igzHi8n29uObRH2S/lHGuWVXbAHk5QdaPansMfGTPcpNYPGY9vDI6Apz0KfYSkUEDOzCartjH+DUYyd3fU33GyQVZfVrFgePCJ68QWhAfgXg9oQIDAQAB';
    var ENCRYPT = new JSEncrypt();
    ENCRYPT.setPublicKey(PUBLICKEY);

    module.exports = ENCRYPT;
});

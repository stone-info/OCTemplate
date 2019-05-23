var CryptoJS = require("crypto-js");

// 加密

var str = '你好吗';
// 密钥 16 位
var key = '1234567890123456';
// 初始向量 initial vector 16 位
var iv = '1234567890123456';
// key 和 iv 可以一致

key = CryptoJS.enc.Utf8.parse(key);
iv = CryptoJS.enc.Utf8.parse(iv);

var encrypted = CryptoJS.DES.encrypt(str, key, {
  iv: iv,
  mode: CryptoJS.mode.CBC,
  padding: CryptoJS.pad.AnsiX923
});

// 转换为字符串
encrypted = encrypted.toString();

console.log(encrypted);

// mode 支持 CBC、CFB、CTR、ECB、OFB, 默认 CBC
// padding 支持 Pkcs7、AnsiX923、Iso10126
// NoPadding、ZeroPadding, 默认 Pkcs7, 即 Pkcs5

// 解密
var decrypted = CryptoJS.DES.decrypt(encrypted, key, {
  iv: iv,
  mode: CryptoJS.mode.CBC,
  padding: CryptoJS.pad.AnsiX923
});

// 转换为 utf8 字符串
decrypted = CryptoJS.enc.Utf8.stringify(decrypted);

console.log(decrypted);

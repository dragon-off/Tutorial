function str_replace(haystack, needle, replacement) {
	var temp = haystack.split(needle);
	return temp.join(replacement);
}
function getXMLHttp()
{
 var xmlhttp;
 try
 {
  xmlhttp = new ActiveXObject ("Msxml2.XMLHTTP");
 }
 catch (e)
 {
  try
  {
   xmlhttp = new ActiveXObject ("Microsoft.XMLHTTP");
  }
  catch (E)
  {
   xmlhttp = false;
  }
 }
 if (!xmlhttp && typeof XMLHttpRequest!='udefined')
 {
  xmlhttp = new XMLHttpRequest();
 }
 return xmlhttp;
}

// javascript-код голосования из примера
var elementHTML=null;
var path;

function AddHTMLAjax(elementHTML,path) 
{
 // создать объект для запроса к серверу
// alert(path);
 var req = getXMLHttp();
 // span рядом с кнопкой
 // в нем будем отображать ход выполнения
 var statusElem = elementHTML;
 req.onreadystatechange = function() 
 { 
 // onreadystatechange активируется при получении ответа сервера
  if (req.readyState == 4) 
  {
   // если запрос закончил выполняться
   statusElem.innerHTML = req.statusText // показать статус (Not Found, ОК..)
//    alert(req.status);
   i=0;
   while(req.status != 200) 
   {
    // если статус 200 (ОК) - выдать ответ пользователю
//    alert("Ответ сервера: "+req.responseText);
    i++;
   if (i==100)
     break;
   }
   if (req.status == 200)
    {elementHTML.innerHTML = req.responseText; }
   // тут можно добавить else с обработкой ошибок запроса
  }
 }
 // (3) задать адрес подключения
 
req.open('GET', path, true); 
 // объект запроса подготовлен: указан адрес и создана функция onreadystatechange
 // для обработки ответа сервера
 req.send(null);  // отослать запрос
// statusElem.innerHTML = 'Ожидаю ответа сервера...'
}

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

// javascript-��� ����������� �� �������
var elementHTML=null;
var path;

function AddHTMLAjax(elementHTML,path) 
{
 // ������� ������ ��� ������� � �������
// alert(path);
 var req = getXMLHttp();
 // span ����� � �������
 // � ��� ����� ���������� ��� ����������
 var statusElem = elementHTML;
 req.onreadystatechange = function() 
 { 
 // onreadystatechange ������������ ��� ��������� ������ �������
  if (req.readyState == 4) 
  {
   // ���� ������ �������� �����������
   statusElem.innerHTML = req.statusText // �������� ������ (Not Found, ��..)
//    alert(req.status);
   i=0;
   while(req.status != 200) 
   {
    // ���� ������ 200 (��) - ������ ����� ������������
//    alert("����� �������: "+req.responseText);
    i++;
   if (i==100)
     break;
   }
   if (req.status == 200)
    {elementHTML.innerHTML = req.responseText; }
   // ��� ����� �������� else � ���������� ������ �������
  }
 }
 // (3) ������ ����� �����������
 
req.open('GET', path, true); 
 // ������ ������� �����������: ������ ����� � ������� ������� onreadystatechange
 // ��� ��������� ������ �������
 req.send(null);  // �������� ������
// statusElem.innerHTML = '������ ������ �������...'
}

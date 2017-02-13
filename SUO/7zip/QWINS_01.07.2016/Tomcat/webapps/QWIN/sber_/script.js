
function check_counter(value,ticket) {
if(value.options[value.selectedIndex].value >1000 && value.options[value.selectedIndex].value <2000)
{

	if(confirm('Окно №'+(value.options[value.selectedIndex].value-1080)+' находится на перерыве, Вы хотите переадресовать клиента?'))
	{
		run_qwin('perevod',value.options[value.selectedIndex].value-1000);
			sd(ticket,value.options[value.selectedIndex].value-1080,1);
	}
} else if(value.options[value.selectedIndex].value >500 && value.options[value.selectedIndex].value <1000)
{

	if(confirm('Окно №'+(value.options[value.selectedIndex].value-580)+' проводятся внутренние работы, Вы хотите переадресовать клиента?'))
	{
		run_qwin('perevod',value.options[value.selectedIndex].value-500);
			sd(ticket,value.options[value.selectedIndex].value-580,1);
	}
} else if(value.options[value.selectedIndex].value >2000)
{
	if(confirm('Окно №'+(value.options[value.selectedIndex].value-2080)+' закрыто, Вы хотите переадресовать клиента?'))
	{
		run_qwin('perevod',value.options[value.selectedIndex].value-2000);
		sd(ticket,value.options[value.selectedIndex].value-2080,1);
	};
} else if(value.options[value.selectedIndex].value <500) {
	

		run_qwin('perevod',value.options[value.selectedIndex].value);
		sd(ticket,value.options[value.selectedIndex].value-80,1);
};

};





function change_avalible(name,to) { //Смена доступности кнопки (0-отключена,1-включена)
	obj=document.getElementById(name);
	if(to==0)
		{
		if(name!='next' && name!='in_work')
			{
			obj.style.backgroundImage=image_1;
			}
		else
			{
			obj.style.backgroundImage=image_2;
						
			}
		obj.style.color="#767676";
		obj.style.cursor="default";
		}
	else
		{
		if(name!='next' && name!='in_work')
			{
			obj.style.backgroundImage=image_3;
			}
		else
			{
			obj.style.backgroundImage=image_4;
			}
		obj.style.color="black";
		obj.style.cursor="pointer";	
		}
} //end change_avalible(name,to)

function type_avalible(type) { //Смена типа доступности кнопок
/*
0 - раб станция закрыта
1 - клиент вызван и обслуживается > вр. повторного вызова
2 - клиент только вызван и можно его повторно вызвать
3 - перерыв
4 - раб станция закрыта
5 - вн.раб.

*/

 sbrf.log("Смена режима отображения кнопок="+type);
	if(type==0) //Рабочая станция закрыта
		{
		change_avalible('next',1);
		change_avalible('in_work',0);
		change_avalible('recall',0);
		change_avalible('otlozh',0);
		change_avalible('number_call',0);
		if(array_7000_w==0)
			change_avalible('registration',0)
		else
			change_avalible('registration',1);
		change_avalible('pereadres',0);
		change_avalible('pereriv',0);
		change_avalible('in_work',0);
		}
	if(type==1) //Клиент вызван и обслуживается
		{
		ticket_alert=0;//для кор. раб. поторного вызова
		change_avalible('next',1);
		change_avalible('recall',0);
		if(counter_transaction_time>=array_501+array_500)
		{
			change_avalible('otlozh',1);
			change_avalible('number_call',1);
			if(array_7000_w==0)
				change_avalible('registration',0)
			else
				change_avalible('registration',1);
			change_avalible('pereadres',1);
			change_avalible('pereriv',1);
			change_avalible('in_work',1);
			document.getElementById('msg_log').style.display='none';
		};
		}
	if(type==2) //Клиент только вызван и можно повторно вызвать
		{
		change_avalible('in_work',0);
		
		document.getElementById("next").value="Сбросить";
		clearTimeout(sbros_call);
		if(counter_transaction_time<=array_501+array_500)
			sbros_call=setTimeout('sbros()', (((array_501+array_500)-counter_transaction_time)*1000));
		change_avalible('next',0);
		change_avalible('recall',1);
		change_avalible('otlozh',0);
		change_avalible('number_call',0);
		change_avalible('registration',0);
		change_avalible('pereadres',0);
		change_avalible('pereriv',0);
		change_avalible('in_work',0);
		document.getElementById('msg_log').style.display='none';
		}
	if(type==3) //Перерыв, повиший вызов
		{
		change_avalible('in_work',0);
		if((counter_item_button==(143) && counter_item_button==(145)) & customer_present==1) {
			
			change_avalible('next',0);
			change_avalible('recall',0);
			change_avalible('otlozh',0);
			change_avalible('number_call',0);
			change_avalible('registration',0);
			change_avalible('pereadres',0);
			change_avalible('pereriv',1);
			change_avalible('in_work',1);
			if(counter_item_button==(145)) {
				change_avalible('next',1);
				change_avalible('number_call',1);
				change_avalible('pereriv',1);
					
			}
		} else {
			change_avalible('next',0);
			change_avalible('recall',0);
			change_avalible('otlozh',0);
			change_avalible('number_call',1);

			if(array_7000_w==0)
				change_avalible('registration',0)
			else
				change_avalible('registration',1);
			change_avalible('pereadres',0);
			change_avalible('pereriv',1);
			change_avalible('in_work',1);
		};
		
		document.getElementById('msg_log').style.display='none';
		}
	if(type==4) //Рабочая станция закрыта
		{
		change_avalible('in_work',0);
		
		change_avalible('next',1);
		change_avalible('recall',0);
		change_avalible('otlozh',0);
		change_avalible('number_call',1);
		if(array_7000_w==0)
			change_avalible('registration',0)
		else
			change_avalible('registration',1);
		change_avalible('pereadres',0);
		change_avalible('pereriv',1);
		change_avalible('in_work',1);
		}
}// end type_avalible(type)


function doSomething(obj) { //Проверка доступности кнопок
	
	el=obj.getAttribute("id");
	
	if(el!='next' & el!='in_work') 
	{

		if(obj.style.backgroundImage==image_3 || obj.style.backgroundImage==image2_3)
		{ 
			if(el=="recall" && ticket_alert<document.getElementById('cst').innerHTML) {
			sbrf.log("Экнопка recall");
				ticket_alert=document.getElementById('cst').innerHTML;
				run_qwin('alert',0);
				change_avalible('recall',0);
			};
			if(el=="pereriv") {  blink_a=0;
				document.getElementById("next").value="Следующий";
				if(customer_present==1 && counter_item_button==(143)) { //проверка в перерыве или нет станция
					run_qwin('pereriv',1);
					type_avalible(0);
				} else {
					run_qwin('pereriv',0);
					type_avalible(3);
				};
			};
		
			if(el=="otlozh") {
				document.getElementById("next").value="Следующий";
				run_qwin('vbuffer',0);
			};
			if(el=="number_call") {
				run_qwin('number_call',0);
			};
			if(el=="pereadres") {
				document.getElementById("next").value="Следующий";
				run_qwin('perevod_msg',0);
			};
			if(el=="registration") {
				run_qwin('spec_reg',0);
			};
		};
	} else {
		if(obj.style.backgroundImage==image_4 || obj.style.backgroundImage==image2_4) 
			{//alert(el);
				if(el=="next") { 
					no_event=true;
					setTimeout('no_event=false;',1500); //блокировка обновления по событию
					clearTimeout(sbros_call);
					document.getElementById("next").value="Следующий";
					//alert("Время обслуживания: "+", время доступности кнопки сброса:");
					run_qwin('next',0);
				};	
				if(el=="in_work") {  blink_a=0;
			
					document.getElementById("next").value="Следующий";
					if(customer_present==1 && counter_item_button==(145)) { //проверка в внутреней работе или нет станция
						run_qwin('in_work',1);
						type_avalible(0);
					} else {
						run_qwin('in_work',0);
						type_avalible(3);
					};
				};
			};
		};
};
﻿#language: ru

@tree

Функционал: прикрепление картинки в форму элемента справочника Товары

Как тестировщик я хочу
проверить работоспособность нового функционала по прикреплению картинки в форму элемента справочника Товары
чтобы в дальнейшем у пользователей не возникало проблем 
Переменные:
	ИмяТовара = "ТестовыйТовар"
	ИмяКартинки = "ТестоваяКартинка"
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
Сценарий: создание картинки в справочнике Хранимые файлы
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.ХранимыеФайлы"
	И я нажимаю на кнопку с именем 'Создать'
	И я нажимаю кнопку выбора у поля с именем 'Владелец'
	И в таблице '' я перехожу к строке:
		| ""      |
		| "Товар" |
	И в таблице '' я выбираю текущую строку
	И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНайти1'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И в поле с именем 'Pattern' я ввожу текст "000000028"
	И я нажимаю на кнопку с именем 'Find'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	// наименование 1
	И в поле с именем 'Наименование' я ввожу текст "Пылесос"
	И я выбираю файл '$КаталогПроекта$\FinalTasks\Task1\VC.jpg'
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	И я запоминаю значение поля "Код" как "Код1" глобально	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И в поле с именем 'Pattern' я ввожу текст "$$Код1$$"
	И я нажимаю на кнопку с именем 'Find'
	И таблица "Список" содержит строки:
		| 'Код'   |
		| '$$Код1$$' |
Сценарий: выбор файла в элементе справочника Товары
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	И в таблице 'Список' в дополнение формы с именем 'СписокСтрокаПоиска' я ввожу текст "000000028"
	И я перехожу к следующему реквизиту	
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'
	И в таблице "Список" я перехожу к строке
			| 'Код'      |
			| '$$Код1$$' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'			
Сценарий: создание файла картинки из элемента справочника Товары
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И в поле с именем 'Наименование' я ввожу текст "$ИмяТовара$"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И в поле с именем 'Наименование' я ввожу текст "$ИмяКартинки$"
	И я выбираю файл '$КаталогПроекта$\FinalTasks\Task1\logotip1c.png'	
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Код" как "КодФайла" глобально
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "какаятокартинка (Файл)" в течение 20 секунд
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
Сценарий: проверка сохранения файла в Справочнике Хранимые файлы
	И Я открываю навигационную ссылку "e1cib/list/Справочник.ХранимыеФайлы"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст "$$КодФайла$$"
	И я нажимаю на кнопку с именем 'Find'
	И таблица "Список" содержит строки:
		| 'Код'        |
		| '$$КодФайла$$' |
Сценарий: загрузка нескольких файлов для одного товара
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.ХранимыеФайлы"
	И я нажимаю на кнопку с именем 'ЗагрузитьФайлы'
	И я нажимаю кнопку выбора у поля с именем 'Владелец'
	И в таблице '' я перехожу к строке:
		| ""      |
		| "Товар" |
	И в таблице '' я выбираю текущую строку
	И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНайти1'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И в поле с именем 'Pattern' я ввожу текст "000000017"
	И я нажимаю на кнопку с именем 'Find'
	И в таблице 'Список' я перехожу к строке:
		| 'Код'       |
		| '000000017' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И я выбираю файл '$КаталогПроекта$\FinalTasks\Task1\pic1.jpg'
	И в таблице 'СписокФайлов' я нажимаю на кнопку с именем 'ДобавитьФайлы'
	И я выбираю файл '$КаталогПроекта$\FinalTasks\Task1\pic2.jpg'
	И в таблице 'СписокФайлов' я нажимаю на кнопку с именем 'ДобавитьФайлы'
	И я нажимаю на кнопку с именем 'Загрузить'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'pic1.jpg'     |
		| 'pic2.jpg'     |
	И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	И в таблице 'Список' в дополнение формы с именем 'СписокСтрокаПоиска' я ввожу текст "000000017"
	И я перехожу к следующему реквизиту	
//	И в таблице "Список" я перехожу к строке
//			| 'Код'       |
//			| '000000017' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'	
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'pic1.jpg'     |
		| 'pic2.jpg'     |
	И в таблице "Список" я перехожу к строке
			| 'Наименование' |
			| 'pic1.jpg'     |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я закрываю все окна клиентского приложения
Сценарий: удаление артефактов тестирования
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.ХранимыеФайлы"
	И в таблице "Список" я перехожу к строке
			| 'Наименование' |
			| 'pic1.jpg' |
	И в таблице "Список" я удаляю строку
	И я нажимаю на кнопку с именем 'Button0'
		
	И в таблице "Список" я перехожу к строке
			| 'Наименование' |
			| 'pic2.jpg' |
	И в таблице "Список" я удаляю строку
	И я нажимаю на кнопку с именем 'Button0'
	И в таблице "Список" я перехожу к строке
			| 'Наименование'      |
			| 'ТестоваяКартинка' |
	И в таблице "Список" я удаляю строку
	И я нажимаю на кнопку с именем 'Button0'
	И в таблице "Список" я перехожу к строке
			| 'Наименование' |
			| 'пылесос'      |
	И в таблице "Список" я удаляю строку
	И я нажимаю на кнопку с именем 'Button0'					


			
		
	//И я делаю клик по элементу формы 'Этот сеанс' 'Open' 'Тип' UI Automation
	// И я делаю клик по элементу "1" UI Automation
	
//	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
//	И я жду закрытия окна "картинкаТест (Файл)" в течение 20 секунд
//	И я нажимаю на кнопку с именем 'ФормаВыбрать'
//	И я нажимаю на кнопку с именем 'ФормаЗаписать'
		


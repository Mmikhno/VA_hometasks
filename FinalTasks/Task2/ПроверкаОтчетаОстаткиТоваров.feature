﻿#language: ru

@tree

Функционал: отчет по остаткам товара на складах

Как тестировщик я хочу
проверить корректность формирования отчета Остатки товаров  
чтобы пользователи могли получать оперативно получать актуальную информацию об остатках с помощью данного отчета 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: загрузка тестовых данных
	И Загрузка справочников и констант
	И Загрузка поступлений
	И Загрузка продаж
	И Загрузка корректировок остатков
	
Сценарий: подготовительные настройки
* установка константы учета по складам
	И я выполняю код встроенного языка на сервере
	"""bsl
		Константы.УчетПоСкладам.Установить(Истина);
	"""
* проведение документов прихода	
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.ПриходТовара"
	И я выполняю код встроенного языка на сервере
	"""bsl
		Документы.ПриходТовара.НайтиПоНомеру("000000027").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000042").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000044").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000035").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000043").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000052").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000054").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000002").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000012").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000013").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000028").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000034").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000016").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000024").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000033").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000045").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000053").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000001").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000004").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000010").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000021").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000008").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000029").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000039").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000046").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000051").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	"""
* проведение документов расхода
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И в таблице "Список" я перехожу к первой строке
	И для каждой строки таблицы "Список" я выполняю
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюПровести' на элементе формы с именем 'Список'
			
Сценарий: проверка отчета по всем складам
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройки'
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	И в таблице "СписокНастроек" я перехожу к строке
			| 'Представление' |
			| 'Основной'      |
	И в таблице "СписокНастроек" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И Табличный документ "Результат" равен макету "МакетОтчета_v1"
	И в табличном документе "Результат" ячейка с адресом "R28C6" равна "4 341,00"
Сценарий: проверка отчета по выбранному складу
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"	
	И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройки'			
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	И в таблице "СписокНастроек" я перехожу к строке
			| 'Представление' |
			| 'Основной'      |
	И в таблице "СписокНастроек" я выбираю текущую строку	
	И я устанавливаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Использование'
	И из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение' я выбираю точное значение "Малый"
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И Табличный документ "Результат" равен макету "МакетОтчета_Склад"
	И в табличном документе "Результат" ячейка с адресом "R20C3" равна "522,00"
Сценарий: помеченный на удаление документ не отображается в отчете
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И в таблице "Список" я перехожу к строке
			| 'Номер'     |
			| '000000018' |
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем 'Список'
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройки'
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	И в таблице "СписокНастроек" я перехожу к строке
			| 'Представление' |
			| 'Основной'      |
	И в таблице "СписокНастроек" я выбираю текущую строку	
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И в табличном документе "Результат" ячейка с адресом "R28C6" равна "4 401,00"
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И в таблице "Список" я перехожу к строке
			| 'Номер'     |
			| '000000018' |
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем 'Список'
	И я закрываю сеанс текущего клиента тестирования
				
				
		
	

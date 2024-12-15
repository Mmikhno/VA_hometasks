﻿#language: ru

@tree

Функционал: Заполнение полей Партнер, Контрагент, Соглашение в заказе покупателя

Как тестировщик я хочу
проверить корректность заполнения полей при создании заказа покупателя 
чтобы убедиться, что у пользователя не возникнет проблем при заполнении документа в проде   

Переменные:

* Партнеры
| 'Код'      | 'Наименование'            | 'Соглашение'                                                      |
| 'Партнер1' | 'Клиент 1 (1 соглашение)' | 'Соглашение с клиентами (расчет по документам + кредитный лимит)' |
| 'Партнер2' | 'Клиент 2 (2 соглашения)' | 'Индивидуальное соглашение 1 (расчет по соглашениям)'             |
| 'Партнер3' | 'Розничный покупатель'    | 'Розничное'                                                       |
| 'Партнер4' | 'Розничный клиент 1'      | 'Розничный клиент 1'                                              |

Компания = "Собственная компания 1"
Склад = "Склад 1 (с контролем остатка)"
Товар = "Товар без характеристик"

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Дано я закрываю все окна клиентского приложения
Сценарий: проверка заполнения поля Организация
		И Я запоминаю значение выражения '0' в переменную "Шаг"
		И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я делаю 4 раз
		И Я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Партнер"+$Шаг$' в переменную "ПартнерN"
		И Я запоминаю значение выражения 'Партнеры.$ПартнерN$.Наименование' в переменную "Партнер"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем 'Partner'
		И в таблице "List" я перехожу к строке
				| 'Наименование' |
				| '$Партнер$'    |
		И в таблице 'List' я выбираю текущую строку
		И из выпадающего списка с именем 'Agreement' я выбираю по строке "Партнеры.$ПартнерN$.Соглашение"
		Если появилось окно с заголовком "Табличная часть товаров будет обновлена" Тогда
			И я нажимаю на кнопку с именем 'FormOK'	
		Если элемент формы с именем 'Company' стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем 'Company'
			И в таблице "List" я перехожу к строке
				| 'Наименование' |
				| '$Компания$'   |
			И в таблице "List" я выбираю текущую строку
		И элемент формы с именем 'Company' стал равен '$Компания$'
		Если элемент формы с именем 'Store' стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем 'Store'
			И в таблице "List" я перехожу к строке
					| 'Наименование' |
					| '$Склад$'      |
			И в таблице 'List' я выбираю текущую строку
			Если появилось окно с заголовком "Табличная часть товаров будет обновлена" Тогда
				И я нажимаю на кнопку с именем 'FormOK'	
		И в таблице 'ItemList' я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице 'ItemList' я нажимаю кнопку выбора у реквизита с именем 'ItemListItem'
		И в таблице 'List' я перехожу к строке:
			| 'Код' | 'Наименование' |
			| '2'   | '$Товар$'      |
		И в таблице 'List' я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		
		
				
									
		



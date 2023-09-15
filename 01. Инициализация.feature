﻿#language: ru

@tree

Функционал: 01. Инициализация системы

Как Аналитик я хочу
наполнить базу НСИ
чтобы использовать её в сценарных тестах

Сценарий: 01.01 Создание пользователя Старк Бран [Администратор]

	И я подключаю TestClient "ЕРПУХ - НСИ" логин "" пароль "" 

		* Создаем пользователя 
		
		И В командном интерфейсе я выбираю 'НСИ и администрирование' 'Настройки пользователей и прав'
		Тогда открылось окно 'Настройки пользователей и прав'
		И я нажимаю на кнопку 'Пользователи'
		Тогда открылось окно 'Пользователи'
		И я нажимаю на кнопку с именем 'СоздатьПользователя'
		Тогда открылось окно 'Пользователь (создание)'
		И в поле 'Полное имя' я ввожу текст 'Администратор'
		
		* Создаем физическое лицо	
			
		И я нажимаю кнопку выбора у поля "Физическое лицо"
		Тогда открылось окно 'Физические лица'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Физическое лицо (создание)'
		И в поле с именем 'ФИО' я ввожу текст 'Старк Бран'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ФизлицоДатаРождения' я ввожу текст '01.01.2000'
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем "ФизлицоПол" я выбираю точное значение 'Мужской'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаЗаписать'
		И я нажимаю на кнопку с именем 'КомандаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Физическое лицо (создание) *' в течение 20 секунд
		Тогда открылось окно 'Физические лица'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Пользователь *'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Когда открылось окно 'Запись пользователя информационной базы'
		И я нажимаю на кнопку 'Да'
		Тогда открылось окно 'Обсуждения (система взаимодействий)'
		И я изменяю флаг 'Больше не задавать этот вопрос'
		И я нажимаю на кнопку 'Нет'
		Тогда открылось окно 'Администратор (Пользователь)'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Администратор (Пользователь)' в течение 20 секунд
		Тогда открылось окно 'Пользователи'
		И в таблице "ПользователиСписок" я выбираю текущую строку

	И я закрываю TestClient "ЕРПУХ - НСИ"

Сценарий: 01.02 Разрешаем открытие внешних обработок

	И я подключаю TestClient "ЕРПУХ - НСИ" логин "Администратор" пароль ""

		Если открылось окно 'Предупреждение безопасности' Тогда
			И я нажимаю на кнопку с именем 'НеЗапрещать'

		Если открылось окно '1С:Предприятие' Тогда
			И я нажимаю на кнопку с именем 'Button1'

	И я закрываю TestClient "ЕРПУХ - НСИ"			

Сценарий: 01.03 Включение подсистем и констант

	И я подключаю TestClient "ЕРПУХ - НСИ" логин "Администратор" пароль "" 

	* Включаем подсистему "Корпоративные закупки"
		
		И Я устанавливаю в константу "ИспользоватьЦентрализованноеУправлениеЗакупками" значение "Истина"	
		
	* Включаем подсистему "Механизмы управления НСИ"

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Общие настройки'
		Тогда открылось окно 'Общие настройки "1С:Управление Холдингом"'
		И я устанавливаю флаг с именем 'ИспользоватьУправлениеНСИ'

	* Включаем подсистему "Управление активами"
	
		И я устанавливаю флаг с именем 'ИспользуетсяУправлениеАктивами'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Общие настройки "1С:Управление Холдингом" *' в течение 20 секунд
		
	* Включаем использование нескольких валют
	
		И Я устанавливаю в константу "ИспользоватьНесколькоВалют" значение "Истина"
		
	* Включаем использование нескольких организаций
	
		И Я устанавливаю в константу "ИспользоватьНесколькоОрганизаций" значение "Истина"
		
	* Включаем использование нескольких складов
	
		И Я устанавливаю в константу "ИспользоватьНесколькоСкладов" значение "Истина"
		
	* Включаем использование нескольких касс
	
		И Я устанавливаю в константу "ИспользоватьНесколькоКасс" значение "Истина"
	
	* Включаем использование актов выполненных работ по нескольким заказам
	
		И Я устанавливаю в константу "ИспользоватьАктыВыполненныхРаботПоНесколькимЗаказам" значение "Истина"		
		
	* Включаем использование внутреннее потребление по нескольким заказам
	
		И Я устанавливаю в константу "ИспользоватьВнутреннееПотреблениеПоНесколькимЗаказам" значение "Истина"		
		
	* Включаем использование начислений зарплаты в нескольких организациях
	
		И Я устанавливаю в константу "ИспользоватьНачислениеЗарплатыВНесколькихОрганизациях" значение "Истина"		

	* Включаем использование нескольких видов номенклатуры
	
		И Я устанавливаю в константу "ИспользоватьНесколькоВидовНоменклатуры" значение "Истина"			
	
	* Включаем использование нескольких касс ККМ
	
		И Я устанавливаю в константу "ИспользоватьНесколькоКассККМ" значение "Истина"

	* Включаем использование нескольких классифкаций задолжденности
	
		И Я устанавливаю в константу "ИспользоватьНесколькоКлассификацийЗадолженности" значение "Истина"
		
	* Включаем использование нескольких расчетных счетов
	
		И Я устанавливаю в константу "ИспользоватьНесколькоРасчетныхСчетов" значение "Истина"
		
	* Включаем использование классификаторов номенклатуры
	
		И Я устанавливаю в константу "ИспользованиеКлассификаторовНоменклатуры" значение "Истина"
		
	* Включаем использование характеристик номенклатуры
	
		И Я устанавливаю в константу "ИспользоватьХарактеристикиНоменклатуры" значение "Истина"
		
	* Включаем использование заказов поставщикам
	
		И Я устанавливаю в константу "ИспользоватьЗаказыПоставщикам" значение "Истина"	

	* Включаем использование заказы на внутреннее потребление
	
		И Я устанавливаю в константу "ИспользоватьЗаказыНаВнутреннееПотребление" значение "Истина"	
	
	* Включаем использование планов на внутреннее потребление
	
		И Я устанавливаю в константу "ИспользоватьПланированиеВнутреннихПотреблений" значение "Истина"	
	
	* Включаем использование статусов внутренних потреблений
	
		И Я устанавливаю в константу "ИспользоватьСтатусыВнутреннихПотреблений" значение "Истина"	

	* Включаем использование статусов заказов на внутреннее потребление
	
		И Я устанавливаю в константу "ИспользоватьСтатусыЗаказовНаВнутреннееПотребление" значение "Истина"	
		
	* Включаем использование поступление по нескольким заказам
	
		И Я устанавливаю в константу "ИспользоватьПоступлениеПоНесколькимЗаказам" значение "Истина"	
		
	* Включаем использование банковских счетов физическими лицами	
	
		Дано Я открываю основную форму регистра сведений "НастройкиВзаиморасчетовПоПрочимДоходам"
		И я устанавливаю флаг с именем 'ИспользоватьВзаиморасчетыПоПрочимДоходам'
		И я устанавливаю флаг с именем 'ИспользоватьВедомостиДляВыплатыПрочихДоходов'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Настройки взаиморасчетов по прочим доходам (создание) *' в течение 20 секунд
		
	И я закрываю TestClient "ЕРПУХ - НСИ"
# Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform ~>1.8.4

Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
Создайте сервисный аккаунт и ключ. service_account_key_file.
Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key.
Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
Подключитесь к консоли ВМ через ssh и выполните команду curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.

# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/1.PNG)
Неправильный путь к файлу с ключом. Нужно убрать точку перед именем файла.

![alt text](https://github.com/StepanovSA/terr2/blob/main/2%20error.PNG)
Ошибка в указании конфигурации vCPU. Минимальный параметр для всех платформ vCPU = 2.
Ошибка в возможности создания standart-v4 еще была, скрин забыл сделать

curl ifconfig.me
![alt text](https://github.com/StepanovSA/terr2/blob/main/3%20curl%20vm.PNG)

Вывод ip ВМ
![alt text](https://github.com/StepanovSA/terr2/blob/main/3%20ip%20vm.PNG)

# Задание 2
Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
Проверьте terraform plan. Изменений быть не должно.
# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/ex%202.PNG)

# Задание 3

Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
Проверьте terraform plan. Изменений быть не должно.

# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/3%20ex.PNG)

# Задание 4

Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.

# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/outputs%204ex.PNG)

# Задание 5

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
Примените изменения.

# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/ex%205.PNG)

# Задание 6

1) Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map(object).
2) Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.

# Ответ

![alt text](https://github.com/StepanovSA/terr2/blob/main/6%20ex.PNG)

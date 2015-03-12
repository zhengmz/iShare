C/C++�����淶
====

�ļ���ʽ
----

### �ļ�Ӧ��Unicode (UTF-8) ���뱣��

### �ļ�����ʹ��Unix���з����棬ÿ��Ӧ��LF������������CRLF

### 

��������
----

### ��ԭ������������Ϊ��

### ��һ��������ƽ̨����Ʒ���������־���ʹ�ò�Ʒ����ͷ����������ͻ

### ����ʹ�ó�������������

### ����������Ϊ��дC���������Ϊ��д����CDateTime

### ����/����������ö��ʿ�ͷ������Сд���������Ϊ��д����asStringGMT

    �����private�ķ����ͺ���������ǰ����»���_����_isValid

### �������״�Ϊ�������ͼ�д������ͬ��������һ������szFileName

    - �����ǰ����Ҫ����m_����m_iTimeZone
    - �ڷ��������Ĳ����У�ǰ����Ҫ����pm_����pm_szDateTime

### ������ȫ��ʹ�ô�д��������»��߸�������MAX_TIME_VALUE_LEN

ע��
----

### ����ԭ�򣺶Գ����ע�Ͳ���Doxygen��ʽ

### ��ͷ�ļ�Ҫ��ϸ��Ҫ������Ľ��ܣ������ļ������ߡ����ڡ��汾�����ܵȣ���

    /**
    * @file         CDateTime.cc
    * @author       Zhengmz
    * @date         2004/11/24
    * @version      0.3.0
    * @brief        The implement of the class CDateTime.
    *
    * Copyright(c) FlowSea 2015. All rights reserved.
    *
    * Change log:
    * <pre>
    *     author      time          version     description
    * ----------------------------------------------------------
    *     zhengmz     2015.11.15    0.0.1       creating
    *     zhengmz     2015.11.18    0.1.0       add TimeZone
    *     zhengmz     2015.11.19    0.1.1       add static func isDateTime
    *     zhengmz     2015.11.20    0.2.0       add previous, next, invalid.
    *     zhengmz     2015.11.24    0.3.0       modify constructor and operator func
    *     zhengmz     2015.12.23    1.0.0       modify default constructor, and add weekDay()
    * </pre>
    */

### �Է���/������ע�ͣ�Ҫ������������������ֵ�����ù����ȣ���

    /**
    * Get the date and time relative to GMT (UTC).
    * @param pm_szFmt: see strftime().
    * @see asString()
    * @return the date and time as a string, formatted by pmszFmt.
    */

### ����ע����//��///

### ��ע��ʹ�� /** �� */ ���

### �Դ�δ�����ע��ʹ�� #if 0 �� #endif ��ϣ�����������������ע��Ƕ��

����
----

### һ���ļ�����ֻ�����ʵ��һ����С�Ĺ��ܣ���һ�����Ӧһ��ͷ�ļ���ʵ���ļ�

### ��������ʹ�� Allman �������

    - �������Ƕ�ռһ�У��������롰���ڡ����Ŀ������ͬ��
    - ����ʹ��tab�������ǿո�

### �ո��ʹ��

    - ������Ҫ�ڷ�����"[]"��Բ����"()"�������κοո�
    - �߼��ͱȽϵĲ�����ǰ��Ҫ�пո����ӿɶ���

### �мǲ�Ҫ��һ��д�������

### ��SQL��䣬Ҫ�ѳ��Ĳ�ѯ�ֳɶ��У������ÿ��ֻ��һ���Ӿ���ӴӾ�
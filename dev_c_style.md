C/C++�����淶
====

### �ļ���ʽ

0. ͷ�ļ��ĺ�׺ȫ����.h��C�����׺��.c��C++�����׺��.cc

1. �ļ�Ӧ��Unicode (UTF-8) ���뱣��

2. �ļ�����ʹ��Unix���з����棬ÿ��Ӧ��LF������������CRLF

### ��������

3. ��ԭ������������Ϊ�����������»���_�������Եý���һЩ

4. ��һ��������ƽ̨����Ʒ���������־���ʹ�ò�Ʒ����ͷ���������ռ䣬��������ͻ

5. ����ʹ�ó�������������

6. ����������Ϊ��дC���������Ϊ��д����CDateTime

  ��ö�ٵ�����Ҳ���ô˷�������enum DateTimeType

7. ����/����������ö��ʿ�ͷ������Сд���������Ϊ��д����asStringGMT

  �����private�ķ����ͺ���������ǰ����»���_����_isValid

8. �������״�Ϊ�������ͼ�д������ͬ��������һ������szFileName

  ��������ǰ׺�����������Ķ��ͱȽ�

  - �����ǰ����Ҫ����m_����m_iTimeZone

  - �ڷ��������Ĳ����У�ǰ����Ҫ����pm_����pm_szDateTime

  �β���pm_ǰ׺�����ں���������l_����������������������򣬸�ʡʱ��Ϳռ�

9. ������ȫ��ʹ�ô�д��������»��߸�������MAX_TIME_VALUE_LEN

### ע��

10. ����ԭ�򣺶Գ����ע�Ͳ���Doxygen��ʽ

11. ��ͷ�ļ�Ҫ��ϸ��Ҫ������Ľ��ܣ������ļ������ߡ����ڡ��汾�����ܵȣ���


      /**
      * @file         CDateTime.cc
      * @author       Zhengmz
      * @date         2015/12/23
      * @version      1.0.0
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


12. �Է���/������ע�ͣ�Ҫ������������������ֵ�����ù����ȣ���


      /**
      * Get the date and time relative to GMT (UTC).
      * @param pm_szFmt: see strftime().
      * @see asString()
      * @return the date and time as a string, formatted by pmszFmt.
      */


13. ����ע����//��///

14. ��ע��ʹ�� /** �� */ ���

15. �Դ�δ�����ע��ʹ�� #if 0 �� #endif ��ϣ�����������������ע��Ƕ��

### ����

16. һ���ļ�����ֻ�����ʵ��һ����С�Ĺ��ܣ���һ�����Ӧһ��ͷ�ļ���ʵ���ļ�

17. ��������ʹ�� Allman �������

  - �������Ƕ�ռһ�У��������롰���ڡ����Ŀ������ͬ��

  - ����ʹ��tab�������ǿո񣬿����ô��뿴��������Ч��

18. �ո��ʹ��

  - ������Ҫ�ڷ�����"[]"��Բ����"()"�������κοո�

  - �߼��ͱȽϵĲ�����ǰ��Ҫ�пո����ӿɶ���

19. �мǲ�Ҫ��һ��д�������

20. ��SQL��䣬Ҫ�ѳ��Ĳ�ѯ�ֳɶ��У������ÿ��ֻ��һ���Ӿ���ӴӾ�

### ������Ҫ

21. ���巽��/����ʱ��������������Ĭ��ֵ����ǿ�����ݴ���

22. ���ʹ�������ռ�namesapce������ͷ�ļ���ʵ�ֳ��򶼱���ʹ��namespace xxx { ... }
    ����ֻ��ʹ��using namespace xxx�����������е���Ԫ����friend��ʾ��undefined reference to��
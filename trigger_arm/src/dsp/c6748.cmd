/****************************************************************************/
/*                                                                          */
/*              DSP C6748 �ڴ�ռ���䶨��                                  */
/*                                                                          */
/*              2014��07��05��                                              */
/*                                                                          */
/****************************************************************************/

MEMORY
{
    SHDSPL2RAM   o = 0x11800000  l = 0x00040000  /* 256KB L2 �������� RAM */

    SHRAM        o = 0x80000000  l = 0x00020000  /* 128KB ���� RAM */
    DDR2         o = 0xC3000000  l = 0x00800000  /* 8M    DSP ����ռ� */
}

SECTIONS
{
    .text:_c_int00	>  DDR2 align(1024)			 /* C ������� */
    .text			>  DDR2             		 /* ��ִ�д��� */
    .stack  		>  DDR2 				     /* ���ϵͳջ */

    .cio			>  DDR2                      /* C ����������� */
    .vectors		>  DDR2      				 /* �ж������� */
    .const			>  DDR2                      /* ���� */
    .data			>  DDR2                      /* �ѳ�ʼ��ȫ�ּ���̬���� */
    .switch			>  DDR2                      /* ��ת�� */
    .sysmem			>  DDR2                      /* ��̬�ڴ�������� */

    .args			>  DDR2
    .ppinfo			>  DDR2
    .ppdata			>  DDR2

    /* TI-ABI �� COFF */
    .pinit			>  DDR2                      /* C++ �ṹ�� */
    .cinit			>  DDR2                      /* ��ʼ���� */

    /* EABI */
    .binit			>  DDR2
    .init_array		>  DDR2
    .fardata		>  DDR2

    .c6xabi.exidx	>  DDR2
    .c6xabi.extab	>  DDR2

	.init_array     >  DDR2

	GROUP(NEARDP_DATA)
	{
	   .neardata
	   .rodata
	   .bss
	}               >  DDR2

    .far			>  DDR2
}

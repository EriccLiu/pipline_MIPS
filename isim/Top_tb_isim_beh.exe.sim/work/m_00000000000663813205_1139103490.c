/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "N:/Xilinx_ISE/workspace/Lab05/one_dist.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {5, 0};
static unsigned int ng3[] = {1U, 0U};
static int ng4[] = {3, 0};
static int ng5[] = {2, 0};
static int ng6[] = {4, 0};
static int ng7[] = {1, 0};
static int ng8[] = {0, 0};
static unsigned int ng9[] = {35U, 0U};
static unsigned int ng10[] = {63U, 0U};
static unsigned int ng11[] = {7U, 0U};
static unsigned int ng12[] = {43U, 0U};
static unsigned int ng13[] = {4U, 0U};



static void Always_28_0(char *t0)
{
    char t6[8];
    char t14[8];
    char t26[8];
    char t36[8];
    char t46[8];
    char t70[8];
    char t83[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    int t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    unsigned int t76;
    int t77;
    int t78;
    int t79;
    int t80;
    int t81;
    int t82;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 6, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 26);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 26);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 63U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 63U);

LAB6:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 6, t5, 6);
    if (t13 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 6, t2, 6);
    if (t13 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 6, t2, 6);
    if (t13 == 1)
        goto LAB11;

LAB12:    t3 = ((char*)((ng13)));
    t25 = xsi_vlog_unsigned_case_compare(t6, 6, t3, 6);
    if (t25 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(37, ng0);

LAB16:    xsi_set_current_line(38, ng0);
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    memset(t14, 0, 8);
    t15 = (t14 + 4);
    t17 = (t16 + 4);
    t18 = *((unsigned int *)t16);
    t19 = (t18 >> 26);
    *((unsigned int *)t14) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 26);
    *((unsigned int *)t15) = t21;
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 63U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 63U);

LAB17:    t24 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t14, 6, t24, 6);
    if (t25 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t14, 6, t2, 6);
    if (t13 == 1)
        goto LAB20;

LAB21:
LAB22:    goto LAB15;

LAB9:    xsi_set_current_line(83, ng0);

LAB65:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 26);
    *((unsigned int *)t26) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 26);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t11 & 63U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 63U);

LAB66:    t15 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t26, 6, t15, 6);
    if (t25 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t26, 6, t2, 6);
    if (t13 == 1)
        goto LAB69;

LAB70:
LAB71:    goto LAB15;

LAB11:    goto LAB9;

LAB13:    goto LAB9;

LAB18:    xsi_set_current_line(42, ng0);

LAB23:    xsi_set_current_line(46, ng0);
    t27 = (t0 + 1048U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t27 = (t26 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 21);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 21);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 31U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 31U);
    t37 = (t0 + 1208U);
    t38 = *((char **)t37);
    memset(t36, 0, 8);
    t37 = (t36 + 4);
    t39 = (t38 + 4);
    t40 = *((unsigned int *)t38);
    t41 = (t40 >> 11);
    *((unsigned int *)t36) = t41;
    t42 = *((unsigned int *)t39);
    t43 = (t42 >> 11);
    *((unsigned int *)t37) = t43;
    t44 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t44 & 31U);
    t45 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t45 & 31U);
    memset(t46, 0, 8);
    t47 = (t26 + 4);
    t48 = (t36 + 4);
    t49 = *((unsigned int *)t26);
    t50 = *((unsigned int *)t36);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB27;

LAB24:    if (t58 != 0)
        goto LAB26;

LAB25:    *((unsigned int *)t46) = 1;

LAB27:    t62 = (t46 + 4);
    t63 = *((unsigned int *)t62);
    t64 = (~(t63));
    t65 = *((unsigned int *)t46);
    t66 = (t65 & t64);
    t67 = (t66 != 0);
    if (t67 > 0)
        goto LAB28;

LAB29:
LAB30:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t26, 0, 8);
    t2 = (t26 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 16);
    *((unsigned int *)t26) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 16);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t11 & 31U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 31U);
    t5 = (t0 + 1208U);
    t15 = *((char **)t5);
    memset(t36, 0, 8);
    t5 = (t36 + 4);
    t16 = (t15 + 4);
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 11);
    *((unsigned int *)t36) = t19;
    t20 = *((unsigned int *)t16);
    t21 = (t20 >> 11);
    *((unsigned int *)t5) = t21;
    t22 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t22 & 31U);
    t23 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t23 & 31U);
    memset(t46, 0, 8);
    t17 = (t26 + 4);
    t24 = (t36 + 4);
    t30 = *((unsigned int *)t26);
    t31 = *((unsigned int *)t36);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t17);
    t34 = *((unsigned int *)t24);
    t35 = (t33 ^ t34);
    t40 = (t32 | t35);
    t41 = *((unsigned int *)t17);
    t42 = *((unsigned int *)t24);
    t43 = (t41 | t42);
    t44 = (~(t43));
    t45 = (t40 & t44);
    if (t45 != 0)
        goto LAB39;

LAB36:    if (t43 != 0)
        goto LAB38;

LAB37:    *((unsigned int *)t46) = 1;

LAB39:    t28 = (t46 + 4);
    t49 = *((unsigned int *)t28);
    t50 = (~(t49));
    t51 = *((unsigned int *)t46);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB40;

LAB41:
LAB42:    goto LAB22;

LAB20:    xsi_set_current_line(61, ng0);

LAB48:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 21);
    *((unsigned int *)t26) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 21);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t11 & 31U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 31U);
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    memset(t36, 0, 8);
    t15 = (t36 + 4);
    t17 = (t16 + 4);
    t18 = *((unsigned int *)t16);
    t19 = (t18 >> 16);
    *((unsigned int *)t36) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 16);
    *((unsigned int *)t15) = t21;
    t22 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t22 & 31U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 31U);
    memset(t46, 0, 8);
    t24 = (t26 + 4);
    t27 = (t36 + 4);
    t30 = *((unsigned int *)t26);
    t31 = *((unsigned int *)t36);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t24);
    t34 = *((unsigned int *)t27);
    t35 = (t33 ^ t34);
    t40 = (t32 | t35);
    t41 = *((unsigned int *)t24);
    t42 = *((unsigned int *)t27);
    t43 = (t41 | t42);
    t44 = (~(t43));
    t45 = (t40 & t44);
    if (t45 != 0)
        goto LAB52;

LAB49:    if (t43 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t46) = 1;

LAB52:    t29 = (t46 + 4);
    t49 = *((unsigned int *)t29);
    t50 = (~(t49));
    t51 = *((unsigned int *)t46);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB53;

LAB54:
LAB55:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t26, 0, 8);
    t2 = (t26 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 16);
    *((unsigned int *)t26) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 16);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t11 & 31U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 31U);
    t5 = (t0 + 1208U);
    t15 = *((char **)t5);
    memset(t36, 0, 8);
    t5 = (t36 + 4);
    t16 = (t15 + 4);
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 16);
    *((unsigned int *)t36) = t19;
    t20 = *((unsigned int *)t16);
    t21 = (t20 >> 16);
    *((unsigned int *)t5) = t21;
    t22 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t22 & 31U);
    t23 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t23 & 31U);
    memset(t46, 0, 8);
    t17 = (t26 + 4);
    t24 = (t36 + 4);
    t30 = *((unsigned int *)t26);
    t31 = *((unsigned int *)t36);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t17);
    t34 = *((unsigned int *)t24);
    t35 = (t33 ^ t34);
    t40 = (t32 | t35);
    t41 = *((unsigned int *)t17);
    t42 = *((unsigned int *)t24);
    t43 = (t41 | t42);
    t44 = (~(t43));
    t45 = (t40 & t44);
    if (t45 != 0)
        goto LAB60;

LAB57:    if (t43 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t46) = 1;

LAB60:    t28 = (t46 + 4);
    t49 = *((unsigned int *)t28);
    t50 = (~(t49));
    t51 = *((unsigned int *)t46);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB61;

LAB62:
LAB63:    goto LAB22;

LAB26:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB27;

LAB28:    xsi_set_current_line(47, ng0);

LAB31:    xsi_set_current_line(48, ng0);
    t68 = ((char*)((ng1)));
    t69 = (t0 + 1608);
    t71 = (t0 + 1608);
    t72 = (t71 + 72U);
    t73 = *((char **)t72);
    t74 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t70, t73, 2, t74, 32, 1);
    t75 = (t70 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (!(t76));
    if (t77 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    t4 = (t0 + 1608);
    t5 = (t4 + 72U);
    t15 = *((char **)t5);
    t16 = ((char*)((ng4)));
    t17 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t26, t36, t46, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t24 = (t26 + 4);
    t7 = *((unsigned int *)t24);
    t13 = (!(t7));
    t27 = (t36 + 4);
    t8 = *((unsigned int *)t27);
    t25 = (!(t8));
    t77 = (t13 && t25);
    t28 = (t46 + 4);
    t9 = *((unsigned int *)t28);
    t78 = (!(t9));
    t79 = (t77 && t78);
    if (t79 == 1)
        goto LAB34;

LAB35:    goto LAB30;

LAB32:    xsi_vlogvar_wait_assign_value(t69, t68, 0, *((unsigned int *)t70), 1, 0LL);
    goto LAB33;

LAB34:    t10 = *((unsigned int *)t46);
    t80 = (t10 + 0);
    t11 = *((unsigned int *)t26);
    t12 = *((unsigned int *)t36);
    t81 = (t11 - t12);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t80, *((unsigned int *)t36), t82, 0LL);
    goto LAB35;

LAB38:    t27 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(53, ng0);

LAB43:    xsi_set_current_line(54, ng0);
    t29 = ((char*)((ng1)));
    t37 = (t0 + 1608);
    t38 = (t0 + 1608);
    t39 = (t38 + 72U);
    t47 = *((char **)t39);
    t48 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t70, t47, 2, t48, 32, 1);
    t61 = (t70 + 4);
    t54 = *((unsigned int *)t61);
    t13 = (!(t54));
    if (t13 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    t4 = (t0 + 1608);
    t5 = (t4 + 72U);
    t15 = *((char **)t5);
    t16 = ((char*)((ng7)));
    t17 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t26, t36, t46, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t24 = (t26 + 4);
    t7 = *((unsigned int *)t24);
    t13 = (!(t7));
    t27 = (t36 + 4);
    t8 = *((unsigned int *)t27);
    t25 = (!(t8));
    t77 = (t13 && t25);
    t28 = (t46 + 4);
    t9 = *((unsigned int *)t28);
    t78 = (!(t9));
    t79 = (t77 && t78);
    if (t79 == 1)
        goto LAB46;

LAB47:    goto LAB42;

LAB44:    xsi_vlogvar_wait_assign_value(t37, t29, 0, *((unsigned int *)t70), 1, 0LL);
    goto LAB45;

LAB46:    t10 = *((unsigned int *)t46);
    t80 = (t10 + 0);
    t11 = *((unsigned int *)t26);
    t12 = *((unsigned int *)t36);
    t81 = (t11 - t12);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t80, *((unsigned int *)t36), t82, 0LL);
    goto LAB47;

LAB51:    t28 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(66, ng0);

LAB56:    xsi_set_current_line(67, ng0);
    t37 = ((char*)((ng10)));
    t38 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 6, 0LL);
    goto LAB55;

LAB59:    t27 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB60;

LAB61:    xsi_set_current_line(71, ng0);

LAB64:    xsi_set_current_line(72, ng0);
    t29 = ((char*)((ng10)));
    t37 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t37, t29, 0, 0, 6, 0LL);
    goto LAB63;

LAB67:    xsi_set_current_line(90, ng0);
    t16 = (t0 + 1048U);
    t17 = *((char **)t16);
    memset(t36, 0, 8);
    t16 = (t36 + 4);
    t24 = (t17 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (t18 >> 21);
    *((unsigned int *)t36) = t19;
    t20 = *((unsigned int *)t24);
    t21 = (t20 >> 21);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t22 & 31U);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 & 31U);
    t27 = (t0 + 1208U);
    t28 = *((char **)t27);
    memset(t46, 0, 8);
    t27 = (t46 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 11);
    *((unsigned int *)t46) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 11);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t34 & 31U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 31U);
    memset(t70, 0, 8);
    t37 = (t36 + 4);
    t38 = (t46 + 4);
    t40 = *((unsigned int *)t36);
    t41 = *((unsigned int *)t46);
    t42 = (t40 ^ t41);
    t43 = *((unsigned int *)t37);
    t44 = *((unsigned int *)t38);
    t45 = (t43 ^ t44);
    t49 = (t42 | t45);
    t50 = *((unsigned int *)t37);
    t51 = *((unsigned int *)t38);
    t52 = (t50 | t51);
    t53 = (~(t52));
    t54 = (t49 & t53);
    if (t54 != 0)
        goto LAB75;

LAB72:    if (t52 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t70) = 1;

LAB75:    t47 = (t70 + 4);
    t55 = *((unsigned int *)t47);
    t56 = (~(t55));
    t57 = *((unsigned int *)t70);
    t58 = (t57 & t56);
    t59 = (t58 != 0);
    if (t59 > 0)
        goto LAB76;

LAB77:
LAB78:    goto LAB71;

LAB69:    xsi_set_current_line(101, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t36, 0, 8);
    t3 = (t36 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 21);
    *((unsigned int *)t36) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 21);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t11 & 31U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 31U);
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    memset(t46, 0, 8);
    t15 = (t46 + 4);
    t17 = (t16 + 4);
    t18 = *((unsigned int *)t16);
    t19 = (t18 >> 16);
    *((unsigned int *)t46) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 16);
    *((unsigned int *)t15) = t21;
    t22 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t22 & 31U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 31U);
    memset(t70, 0, 8);
    t24 = (t36 + 4);
    t27 = (t46 + 4);
    t30 = *((unsigned int *)t36);
    t31 = *((unsigned int *)t46);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t24);
    t34 = *((unsigned int *)t27);
    t35 = (t33 ^ t34);
    t40 = (t32 | t35);
    t41 = *((unsigned int *)t24);
    t42 = *((unsigned int *)t27);
    t43 = (t41 | t42);
    t44 = (~(t43));
    t45 = (t40 & t44);
    if (t45 != 0)
        goto LAB87;

LAB84:    if (t43 != 0)
        goto LAB86;

LAB85:    *((unsigned int *)t70) = 1;

LAB87:    t29 = (t70 + 4);
    t49 = *((unsigned int *)t29);
    t50 = (~(t49));
    t51 = *((unsigned int *)t70);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB88;

LAB89:
LAB90:    goto LAB71;

LAB74:    t39 = (t70 + 4);
    *((unsigned int *)t70) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(91, ng0);

LAB79:    xsi_set_current_line(92, ng0);
    t48 = ((char*)((ng1)));
    t61 = (t0 + 1608);
    t62 = (t0 + 1608);
    t68 = (t62 + 72U);
    t69 = *((char **)t68);
    t71 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t83, t69, 2, t71, 32, 1);
    t72 = (t83 + 4);
    t60 = *((unsigned int *)t72);
    t77 = (!(t60));
    if (t77 == 1)
        goto LAB80;

LAB81:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1608);
    t4 = (t0 + 1608);
    t5 = (t4 + 72U);
    t15 = *((char **)t5);
    t16 = ((char*)((ng4)));
    t17 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t36, t46, t70, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t24 = (t36 + 4);
    t7 = *((unsigned int *)t24);
    t13 = (!(t7));
    t27 = (t46 + 4);
    t8 = *((unsigned int *)t27);
    t25 = (!(t8));
    t77 = (t13 && t25);
    t28 = (t70 + 4);
    t9 = *((unsigned int *)t28);
    t78 = (!(t9));
    t79 = (t77 && t78);
    if (t79 == 1)
        goto LAB82;

LAB83:    goto LAB78;

LAB80:    xsi_vlogvar_wait_assign_value(t61, t48, 0, *((unsigned int *)t83), 1, 0LL);
    goto LAB81;

LAB82:    t10 = *((unsigned int *)t70);
    t80 = (t10 + 0);
    t11 = *((unsigned int *)t36);
    t12 = *((unsigned int *)t46);
    t81 = (t11 - t12);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t80, *((unsigned int *)t46), t82, 0LL);
    goto LAB83;

LAB86:    t28 = (t70 + 4);
    *((unsigned int *)t70) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB87;

LAB88:    xsi_set_current_line(102, ng0);

LAB91:    xsi_set_current_line(103, ng0);
    t37 = ((char*)((ng10)));
    t38 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 6, 0LL);
    goto LAB90;

}


extern void work_m_00000000000663813205_1139103490_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_00000000000663813205_1139103490", "isim/Top_tb_isim_beh.exe.sim/work/m_00000000000663813205_1139103490.didat");
	xsi_register_executes(pe);
}

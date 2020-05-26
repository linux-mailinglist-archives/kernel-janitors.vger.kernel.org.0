Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9189A1DE392
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 May 2020 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgEVJ5H (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 May 2020 05:57:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48024 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgEVJ5G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 May 2020 05:57:06 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04M9pV6D147900;
        Fri, 22 May 2020 09:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=0V3vrVVBtUNxnLjq61/47fmwyQQP6sizC37Id65usHw=;
 b=Ix+63zbWsfTnAc3aRNbLgukhCixrZLYtINpD1sga+b8O/CvfMOCo3KvfhmADGXp2aiFU
 fG2eoasOpcfIDYaeAceOB3ByxnELaIkJc4jDDv92Yvdbe5S6/c5vo/h3sNq5NA3Aa2kS
 /+Ekvng1znM+9Qt4Ye6xwy00B7spb9Qp1RyRmCfzqBtW5caF8IlLsiEpVEfD232QNcLC
 ZzBtqYnr3OVgpgBzbJAu0wZciTg6/tPeLNVW7uiURKEqrIxlEDKEll2YHEZ/oLFbSWjw
 z1Qlq0shYng9kxtO2ak1rB5ne6cgNMOBEv2OPOM37x1XRApqRRFHAK72Yb036/YLGdUp xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31501rkfq7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 May 2020 09:56:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04M9qaCV086299;
        Fri, 22 May 2020 09:56:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 314gmaunf5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 May 2020 09:56:52 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04M9uoxA027043;
        Fri, 22 May 2020 09:56:52 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 22 May 2020 02:56:49 -0700
Date:   Fri, 22 May 2020 12:56:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     oshpigelman@habana.ai
Cc:     Omer Shpigelman <oshpigelman@habana.ai>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] habanalabs: add gaudi security module
Message-ID: <20200522095640.GA32453@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=904
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=3
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005220080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=935 clxscore=1011 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005220080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Omer Shpigelman,

The patch 3a3a5bf19639: "habanalabs: add gaudi security module" from
May 11, 2020, leads to the following static checker warning:

	drivers/misc/habanalabs/gaudi/gaudi_security.c:527 gaudi_init_mme_protection_bits()
	warn: odd binop '0x60400 & 0x7f'

drivers/misc/habanalabs/gaudi/gaudi_security.c
   514          mask |= 1 << ((mmMME0_CTRL_TE_CLOSE_CGATE & 0x7F) >> 2);
   515          mask |= 1 << ((mmMME0_CTRL_AGU_SM_INFLIGHT_CNTR & 0x7F) >> 2);
   516          mask |= 1 << ((mmMME0_CTRL_AGU_SM_TOTAL_CNTR & 0x7F) >> 2);
   517          mask |= 1 << ((mmMME0_CTRL_EZSYNC_OUT_CREDIT & 0x7F) >> 2);
   518          mask |= 1 << ((mmMME0_CTRL_PCU_RL_SAT_SEC & 0x7F) >> 2);
   519          mask |= 1 << ((mmMME0_CTRL_AGU_SYNC_MSG_AXI_USER & 0x7F) >> 2);
   520          mask |= 1 << ((mmMME0_CTRL_QM_SLV_LBW_CLK_EN & 0x7F) >> 2);
   521  
   522          WREG32(pb_addr + word_offset, ~mask);
   523  
   524          pb_addr = (mmMME0_CTRL_SHADOW_0_STATUS & ~0xFFF) + PROT_BITS_OFFS;
   525          word_offset = ((mmMME0_CTRL_SHADOW_0_STATUS & PROT_BITS_OFFS) >> 7)
   526                          << 2;
   527          mask = 1 << ((mmMME0_CTRL_SHADOW_0_STATUS & 0x7F) >> 2);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is zero.

   528  
   529          WREG32(pb_addr + word_offset, ~mask);
   530  
   531          pb_addr = (mmMME0_QM_GLBL_CFG0 & ~0xFFF) + PROT_BITS_OFFS;
   532          word_offset = ((mmMME0_QM_GLBL_CFG0 & PROT_BITS_OFFS) >> 7) << 2;
   533          mask = 1 << ((mmMME0_QM_GLBL_CFG0 & 0x7F) >> 2);
   534          mask |= 1 << ((mmMME0_QM_GLBL_CFG1 & 0x7F) >> 2);

There are a about 300 similar warnings.

drivers/misc/habanalabs/gaudi/gaudi_security.c:527 gaudi_init_mme_protection_bits() warn: odd binop '0x60400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:532 gaudi_init_mme_protection_bits() warn: odd binop '0x68000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:533 gaudi_init_mme_protection_bits() warn: odd binop '0x68000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:567 gaudi_init_mme_protection_bits() warn: odd binop '0x68080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:604 gaudi_init_mme_protection_bits() warn: odd binop '0x68100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:624 gaudi_init_mme_protection_bits() warn: odd binop '0x68180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:657 gaudi_init_mme_protection_bits() warn: odd binop '0x68200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:695 gaudi_init_mme_protection_bits() warn: odd binop '0x68280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:733 gaudi_init_mme_protection_bits() warn: odd binop '0x68300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:763 gaudi_init_mme_protection_bits() warn: odd binop '0x68400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:821 gaudi_init_mme_protection_bits() warn: odd binop '0x68a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:846 gaudi_init_mme_protection_bits() warn: odd binop '0x68b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:879 gaudi_init_mme_protection_bits() warn: odd binop '0x68c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:899 gaudi_init_mme_protection_bits() warn: odd binop '0x68c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:920 gaudi_init_mme_protection_bits() warn: odd binop '0x68d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:962 gaudi_init_mme_protection_bits() warn: odd binop '0xe0400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1006 gaudi_init_mme_protection_bits() warn: odd binop '0x160400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1011 gaudi_init_mme_protection_bits() warn: odd binop '0x168000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1012 gaudi_init_mme_protection_bits() warn: odd binop '0x168000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1046 gaudi_init_mme_protection_bits() warn: odd binop '0x168080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1083 gaudi_init_mme_protection_bits() warn: odd binop '0x168100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1103 gaudi_init_mme_protection_bits() warn: odd binop '0x168180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1136 gaudi_init_mme_protection_bits() warn: odd binop '0x168200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1174 gaudi_init_mme_protection_bits() warn: odd binop '0x168280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1212 gaudi_init_mme_protection_bits() warn: odd binop '0x168300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1242 gaudi_init_mme_protection_bits() warn: odd binop '0x168400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1300 gaudi_init_mme_protection_bits() warn: odd binop '0x168a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1326 gaudi_init_mme_protection_bits() warn: odd binop '0x168b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1359 gaudi_init_mme_protection_bits() warn: odd binop '0x168c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1379 gaudi_init_mme_protection_bits() warn: odd binop '0x168c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1400 gaudi_init_mme_protection_bits() warn: odd binop '0x168d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1442 gaudi_init_mme_protection_bits() warn: odd binop '0x1e0400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1489 gaudi_init_dma_protection_bits() warn: odd binop '0x508000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1490 gaudi_init_dma_protection_bits() warn: odd binop '0x508000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1524 gaudi_init_dma_protection_bits() warn: odd binop '0x508080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1561 gaudi_init_dma_protection_bits() warn: odd binop '0x508100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1581 gaudi_init_dma_protection_bits() warn: odd binop '0x508180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1614 gaudi_init_dma_protection_bits() warn: odd binop '0x508200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1652 gaudi_init_dma_protection_bits() warn: odd binop '0x508280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1691 gaudi_init_dma_protection_bits() warn: odd binop '0x508300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1721 gaudi_init_dma_protection_bits() warn: odd binop '0x508400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1779 gaudi_init_dma_protection_bits() warn: odd binop '0x508a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1805 gaudi_init_dma_protection_bits() warn: odd binop '0x508b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1838 gaudi_init_dma_protection_bits() warn: odd binop '0x508c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1858 gaudi_init_dma_protection_bits() warn: odd binop '0x508c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1879 gaudi_init_dma_protection_bits() warn: odd binop '0x508d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1884 gaudi_init_dma_protection_bits() warn: odd binop '0x528000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1885 gaudi_init_dma_protection_bits() warn: odd binop '0x528000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1919 gaudi_init_dma_protection_bits() warn: odd binop '0x528080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1956 gaudi_init_dma_protection_bits() warn: odd binop '0x528100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1976 gaudi_init_dma_protection_bits() warn: odd binop '0x528180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2009 gaudi_init_dma_protection_bits() warn: odd binop '0x528200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2047 gaudi_init_dma_protection_bits() warn: odd binop '0x528280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2086 gaudi_init_dma_protection_bits() warn: odd binop '0x528300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2116 gaudi_init_dma_protection_bits() warn: odd binop '0x528400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2174 gaudi_init_dma_protection_bits() warn: odd binop '0x528a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2201 gaudi_init_dma_protection_bits() warn: odd binop '0x528b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2234 gaudi_init_dma_protection_bits() warn: odd binop '0x528c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2254 gaudi_init_dma_protection_bits() warn: odd binop '0x528c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2275 gaudi_init_dma_protection_bits() warn: odd binop '0x528d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2280 gaudi_init_dma_protection_bits() warn: odd binop '0x548000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2281 gaudi_init_dma_protection_bits() warn: odd binop '0x548000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2315 gaudi_init_dma_protection_bits() warn: odd binop '0x548080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2352 gaudi_init_dma_protection_bits() warn: odd binop '0x548100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2372 gaudi_init_dma_protection_bits() warn: odd binop '0x548180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2405 gaudi_init_dma_protection_bits() warn: odd binop '0x548200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2443 gaudi_init_dma_protection_bits() warn: odd binop '0x548280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2482 gaudi_init_dma_protection_bits() warn: odd binop '0x548300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2512 gaudi_init_dma_protection_bits() warn: odd binop '0x548400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2570 gaudi_init_dma_protection_bits() warn: odd binop '0x548a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2597 gaudi_init_dma_protection_bits() warn: odd binop '0x548b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2630 gaudi_init_dma_protection_bits() warn: odd binop '0x548c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2650 gaudi_init_dma_protection_bits() warn: odd binop '0x548c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2671 gaudi_init_dma_protection_bits() warn: odd binop '0x548d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2676 gaudi_init_dma_protection_bits() warn: odd binop '0x568000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2677 gaudi_init_dma_protection_bits() warn: odd binop '0x568000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2711 gaudi_init_dma_protection_bits() warn: odd binop '0x568080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2748 gaudi_init_dma_protection_bits() warn: odd binop '0x568100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2768 gaudi_init_dma_protection_bits() warn: odd binop '0x568180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2801 gaudi_init_dma_protection_bits() warn: odd binop '0x568200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2839 gaudi_init_dma_protection_bits() warn: odd binop '0x568280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2878 gaudi_init_dma_protection_bits() warn: odd binop '0x568300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2908 gaudi_init_dma_protection_bits() warn: odd binop '0x568400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2966 gaudi_init_dma_protection_bits() warn: odd binop '0x568a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2993 gaudi_init_dma_protection_bits() warn: odd binop '0x568b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3026 gaudi_init_dma_protection_bits() warn: odd binop '0x568c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3046 gaudi_init_dma_protection_bits() warn: odd binop '0x568c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3067 gaudi_init_dma_protection_bits() warn: odd binop '0x568d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3072 gaudi_init_dma_protection_bits() warn: odd binop '0x588000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3073 gaudi_init_dma_protection_bits() warn: odd binop '0x588000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3107 gaudi_init_dma_protection_bits() warn: odd binop '0x588080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3144 gaudi_init_dma_protection_bits() warn: odd binop '0x588100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3164 gaudi_init_dma_protection_bits() warn: odd binop '0x588180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3197 gaudi_init_dma_protection_bits() warn: odd binop '0x588200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3235 gaudi_init_dma_protection_bits() warn: odd binop '0x588280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3274 gaudi_init_dma_protection_bits() warn: odd binop '0x588300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3304 gaudi_init_dma_protection_bits() warn: odd binop '0x588400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3362 gaudi_init_dma_protection_bits() warn: odd binop '0x588a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3389 gaudi_init_dma_protection_bits() warn: odd binop '0x588b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3422 gaudi_init_dma_protection_bits() warn: odd binop '0x588c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3442 gaudi_init_dma_protection_bits() warn: odd binop '0x588c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3463 gaudi_init_dma_protection_bits() warn: odd binop '0x588d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3468 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3469 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3503 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3540 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3560 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3593 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3631 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3670 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3700 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3758 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3785 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3818 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3838 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3859 gaudi_init_dma_protection_bits() warn: odd binop '0x5a8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3864 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3865 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3899 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3936 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3956 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3989 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4027 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4066 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4096 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4154 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4181 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4214 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4234 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4255 gaudi_init_dma_protection_bits() warn: odd binop '0x5c8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4260 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4261 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4295 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4332 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4352 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4385 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4423 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4462 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4492 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4550 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4577 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4610 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4630 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4651 gaudi_init_dma_protection_bits() warn: odd binop '0x5e8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4656 gaudi_init_dma_protection_bits() warn: odd binop '0x500000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4657 gaudi_init_dma_protection_bits() warn: odd binop '0x500000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4674 gaudi_init_dma_protection_bits() warn: odd binop '0x500100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4705 gaudi_init_dma_protection_bits() warn: odd binop '0x500200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4721 gaudi_init_dma_protection_bits() warn: odd binop '0x520000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4722 gaudi_init_dma_protection_bits() warn: odd binop '0x520000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4739 gaudi_init_dma_protection_bits() warn: odd binop '0x520100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4770 gaudi_init_dma_protection_bits() warn: odd binop '0x520200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4786 gaudi_init_dma_protection_bits() warn: odd binop '0x540000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4787 gaudi_init_dma_protection_bits() warn: odd binop '0x540000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4804 gaudi_init_dma_protection_bits() warn: odd binop '0x540100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4834 gaudi_init_dma_protection_bits() warn: odd binop '0x540200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4850 gaudi_init_dma_protection_bits() warn: odd binop '0x560000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4851 gaudi_init_dma_protection_bits() warn: odd binop '0x560000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4868 gaudi_init_dma_protection_bits() warn: odd binop '0x560100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4898 gaudi_init_dma_protection_bits() warn: odd binop '0x560200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4914 gaudi_init_dma_protection_bits() warn: odd binop '0x580000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4915 gaudi_init_dma_protection_bits() warn: odd binop '0x580000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4932 gaudi_init_dma_protection_bits() warn: odd binop '0x580100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4962 gaudi_init_dma_protection_bits() warn: odd binop '0x580200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4978 gaudi_init_dma_protection_bits() warn: odd binop '0x5a0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4979 gaudi_init_dma_protection_bits() warn: odd binop '0x5a0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4996 gaudi_init_dma_protection_bits() warn: odd binop '0x5a0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5026 gaudi_init_dma_protection_bits() warn: odd binop '0x5a0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5042 gaudi_init_dma_protection_bits() warn: odd binop '0x5c0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5043 gaudi_init_dma_protection_bits() warn: odd binop '0x5c0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5060 gaudi_init_dma_protection_bits() warn: odd binop '0x5c0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5090 gaudi_init_dma_protection_bits() warn: odd binop '0x5c0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5106 gaudi_init_dma_protection_bits() warn: odd binop '0x5e0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5107 gaudi_init_dma_protection_bits() warn: odd binop '0x5e0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5124 gaudi_init_dma_protection_bits() warn: odd binop '0x5e0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5154 gaudi_init_dma_protection_bits() warn: odd binop '0x5e0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5188 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5189 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5223 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5260 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5280 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5313 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5351 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5391 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5421 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5479 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5506 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5539 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5559 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5580 gaudi_init_tpc_protection_bits() warn: odd binop '0xe08d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5592 gaudi_init_tpc_protection_bits() warn: odd binop '0xe06900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5646 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5647 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5681 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5718 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5738 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5771 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5809 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5847 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5877 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5935 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5962 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5995 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6015 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6036 gaudi_init_tpc_protection_bits() warn: odd binop '0xe48d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6048 gaudi_init_tpc_protection_bits() warn: odd binop '0xe46900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6102 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6103 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6137 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6174 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6194 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6227 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6265 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6303 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6333 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6391 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6417 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6450 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6470 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6491 gaudi_init_tpc_protection_bits() warn: odd binop '0xe88d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6503 gaudi_init_tpc_protection_bits() warn: odd binop '0xe86900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6557 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6558 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6592 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6629 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6649 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6682 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6720 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6758 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6788 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6846 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6872 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6905 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6925 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6946 gaudi_init_tpc_protection_bits() warn: odd binop '0xec8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6958 gaudi_init_tpc_protection_bits() warn: odd binop '0xec6900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7012 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7013 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7047 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7084 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7104 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7137 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7175 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7213 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7243 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7301 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7327 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7360 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7380 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7401 gaudi_init_tpc_protection_bits() warn: odd binop '0xf08d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7413 gaudi_init_tpc_protection_bits() warn: odd binop '0xf06900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7467 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7468 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7502 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7539 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7559 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7592 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7630 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7668 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7698 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7756 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7782 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7815 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7835 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7856 gaudi_init_tpc_protection_bits() warn: odd binop '0xf48d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7868 gaudi_init_tpc_protection_bits() warn: odd binop '0xf46900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7922 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7923 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7957 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7994 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8014 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8047 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8085 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8123 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8153 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8211 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8238 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8271 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8291 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8313 gaudi_init_tpc_protection_bits() warn: odd binop '0xf88d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8325 gaudi_init_tpc_protection_bits() warn: odd binop '0xf86900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8379 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8380 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8414 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8451 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8471 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8504 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8542 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8582 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8612 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8670 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8696 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8729 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8749 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8770 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8782 gaudi_init_tpc_protection_bits() warn: odd binop '0xfc6900 & 0x7f'

regards,
dan carpenter

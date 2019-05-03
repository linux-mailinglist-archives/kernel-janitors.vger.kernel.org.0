Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1870D12ED9
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 15:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfECNMh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 09:12:37 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49666 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfECNMh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 09:12:37 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43Cxer8125149;
        Fri, 3 May 2019 13:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=MMObSqnUvZg/pw4/KJCDotFRDnT01zA68jaBNnj9OgE=;
 b=qUg47+m95JBg2ca2b6a48JHrJwneW1R69dw5wRV7xN6rYz1aYxGwSjURS4BNYj/ZRI6i
 5RVS8ubzZrc0YTYXvw0r0p+TulIFw9ILPP5E751kVX8HnfGD2cMPCNt56HZuSlOAhApQ
 xnXEWlxD6EQiV3dXcEyVlAxytLUSZqJ4/tA4uL/zrkXLPWU5F3Ljxebak/lO46IoaPWZ
 XZWEvk0gX3upAj1JFBFQ5qGvM0uKf2q2XX1Bd9o5VioUyPVP8iH0Vplzb9VRMasWqaNU
 2Uj83nmAKYGI67Oe4ankebZiW9JQ8CcxvtqhC7twTaSG0VrF9v4OPJJBUet/D/5L0n5w sA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 2s6xhypmct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 13:12:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43DBtbh176531;
        Fri, 3 May 2019 13:12:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2s7p8aaw4g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 13:12:29 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x43DCR0o016253;
        Fri, 3 May 2019 13:12:27 GMT
Received: from mwanda (/196.104.111.181)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 May 2019 06:12:26 -0700
Date:   Fri, 3 May 2019 16:12:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ren_guo@c-sky.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] csky: Cache and TLB routines
Message-ID: <20190503131147.GK29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=317
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030082
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=361 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030082
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Guo Ren,

This is a semi-automatic email about new static checker warnings.

The patch 00a9730e1007: "csky: Cache and TLB routines" from Sep 5,
2018, leads to the following Smatch complaint:

    ./arch/csky/mm/tlb.c:130 flush_tlb_page()
    warn: variable dereferenced before check 'vma' (see line 128)

./arch/csky/mm/tlb.c
   127		int cpu = smp_processor_id();
   128		int newpid = cpu_asid(cpu, vma->vm_mm);
                                           ^^^^^^^^^^
Dereferenced

   129	
   130		if (!vma || cpu_context(cpu, vma->vm_mm) != 0) {
                    ^^^^
Checked too late.

   131			page &= (PAGE_MASK << 1);
   132	

regards,
dan carpenter

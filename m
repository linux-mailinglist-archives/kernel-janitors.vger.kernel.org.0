Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E13F22EB12
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 13:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgG0LVk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 07:21:40 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:50712 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726357AbgG0LVk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 07:21:40 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RBFbms015233
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2020 04:21:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0818; bh=lcJcshd8mrejINllu+fMd9G+pG06lDn2oTv/f//RN4k=;
 b=rMLERsDIqlBoWy76pyWPjBB3kYZ0I8mEmMJNLpkL4nJHvpi/kmIN5iQmW4FpIF5cNZ+y
 YWok0zSzBSGECxrV1BN8GWNToNQBSh0HWioV9+T6cZpApWbt0d2AcXt00qejlqIR2BOC
 3l61hwNAo0wHkSZcU8lWG+SVCfsNUDl4VVdmpqejgS3o3TxVEAxO3HsTDjCGZPIUvjHe
 Wuv74i2rh5Yc7nRkPwku+SBMqjVCtRNrESgqvA8iouJn4epVC5UCbemJfvKKzvfpYmEi
 gFEKF4PPhh+3oJdDQok2QIPcGeoETOc6rsvNubu/ZSY1w8KuQU3Fe2y5H3Ya2G9B2+cq uA== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
        by mx0a-0016f401.pphosted.com with ESMTP id 32gj3qq2rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2020 04:21:39 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 27 Jul
 2020 04:21:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 04:21:38 -0700
Received: from NN-LT0049.marvell.com (NN-LT0049.marvell.com [10.193.54.6])
        by maili.marvell.com (Postfix) with ESMTP id 047D93F7040;
        Mon, 27 Jul 2020 04:21:35 -0700 (PDT)
From:   Alexander Lobakin <alobakin@marvell.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Alexander Lobakin <alobakin@marvell.com>,
        Igor Russkikh <irusskikh@marvell.com>,
        Michal Kalderon <michal.kalderon@marvell.com>,
        "Ariel Elior" <aelior@marvell.com>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] qed: sanitize PBL chains allocation
Date:   Mon, 27 Jul 2020 14:21:17 +0300
Message-ID: <20200727112117.406-1-alobakin@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_07:2020-07-27,2020-07-27 signatures=0
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Data: Mon, 27 Jul 2020 13:32:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>

> Hello Alexander Lobakin,

Hi Dan!

> The patch 9b6ee3cf95d3: "qed: sanitize PBL chains allocation" from Jul 23, 2020, leads to the following 
> static checker warning:
> 
> 	drivers/net/ethernet/qlogic/qed/qed_chain.c:299 qed_chain_alloc_pbl()
> 	error: uninitialized symbol 'pbl_virt'.

Oh Gosh, how could I miss that with W=1 C=1.
I'm very glad you detected this, I'll submit a fix in just an hour and
mention you in "Reported-by" tag, thanks so much!

> drivers/net/ethernet/qlogic/qed/qed_chain.c
>    249  static int qed_chain_alloc_pbl(struct qed_dev *cdev, struct qed_chain *chain)
>    250  {
>    251          struct device *dev = &cdev->pdev->dev;
>    252          struct addr_tbl_entry *addr_tbl;
>    253          dma_addr_t phys, pbl_phys;
>    254          __le64 *pbl_virt;
>                 ^^^^^^^^^^^^^^^^
> 
>    255          u32 page_cnt, i;
>    256          size_t size;
>    257          void *virt;
>    258  
>    259          page_cnt = chain->page_cnt;
>    260  
>    261          size = array_size(page_cnt, sizeof(*addr_tbl));
>    262          if (unlikely(size == SIZE_MAX))
>    263                  return -EOVERFLOW;
>    264  
>    265          addr_tbl = vzalloc(size);
>    266          if (!addr_tbl)
>    267                  return -ENOMEM;
>    268  
>    269          chain->pbl.pp_addr_tbl = addr_tbl;
>    270  
>    271          if (chain->b_external_pbl)
>    272                  goto alloc_pages;
>                         ^^^^^^^^^^^^^^^^ uninitialized
> 
>    273  
>    274          size = array_size(page_cnt, sizeof(*pbl_virt));
>    275          if (unlikely(size == SIZE_MAX))
>    276                  return -EOVERFLOW;
>    277  
>    278          pbl_virt = dma_alloc_coherent(dev, size, &pbl_phys, GFP_KERNEL);
>    279          if (!pbl_virt)
>    280                  return -ENOMEM;
>    281  
>    282          chain->pbl_sp.table_virt = pbl_virt;
>    283          chain->pbl_sp.table_phys = pbl_phys;
>    284          chain->pbl_sp.table_size = size;
>    285  
>    286  alloc_pages:
>    287          for (i = 0; i < page_cnt; i++) {
>    288                  virt = dma_alloc_coherent(dev, chain->page_size, &phys,
>    289                                            GFP_KERNEL);
>    290                  if (!virt)
>    291                          return -ENOMEM;
>    292  
>    293                  if (i == 0) {
>    294                          qed_chain_init_mem(chain, virt, phys);
>    295                          qed_chain_reset(chain);
>    296                  }
>    297  
>    298                  /* Fill the PBL table with the physical address of the page */
>    299                  pbl_virt[i] = cpu_to_le64(phys);
>                         ^^^^^^^^^^^
>    300  
>    301                  /* Keep the virtual address of the page */
>    302                  addr_tbl[i].virt_addr = virt;
>    303                  addr_tbl[i].dma_map = phys;
>    304          }
>    305  
>    306          return 0;
>    307  }
> 
> regards,
> dan carpenter

Al

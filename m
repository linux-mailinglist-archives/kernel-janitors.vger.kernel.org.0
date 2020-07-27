Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3532122EA1C
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Jul 2020 12:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgG0KeV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Jul 2020 06:34:21 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56424 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgG0KeU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jul 2020 06:34:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RAVb9c059965;
        Mon, 27 Jul 2020 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3I7Olt7ZVk3CadTlRULtNisWQsyxrRPqMw8+mT6nKEc=;
 b=SYUY3JCeom3Ftfrq4bsUJgF91CeJTxU+xpHJzQbAB1lP1323RyB1Qy5H56BKdoIVIava
 G+gO9PkafDDCihpCGe0FbQFm0IcySW1Rveo+gxu5lE4kmFO7LQrxt9QTKA6Uc323zYUV
 8EjuzSIDetnXYXAD6fYsdWTmL4un6ezJJNZriBW77SOpMWhC3rdFdv+3vd4VLb2ThikW
 iNqlhNVyurhz/2qT7uhX41kIL/brEYroauvZ2TXb/uu9uINqI2GWSqS4S5lOOa8RhAYs
 fzC5F5T+39xBpjFwwqKvXHeiDQXZMvnNgfn/VAqEsZ1tBygKKSOYmxR4d/xGThJAfXrM pQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 32hu1j8rst-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 10:34:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RAOW6P131089;
        Mon, 27 Jul 2020 10:32:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 32hu5qp9tu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 10:32:17 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RAWGCp015220;
        Mon, 27 Jul 2020 10:32:16 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 03:32:16 -0700
Date:   Mon, 27 Jul 2020 13:32:10 +0300
From:   <dan.carpenter@oracle.com>
To:     alobakin@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] qed: sanitize PBL chains allocation
Message-ID: <20200727103210.GA375660@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=3 spamscore=0 mlxlogscore=977 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 mlxlogscore=993
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=3 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270077
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Alexander Lobakin,

The patch 9b6ee3cf95d3: "qed: sanitize PBL chains allocation" from
Jul 23, 2020, leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_chain.c:299 qed_chain_alloc_pbl()
	error: uninitialized symbol 'pbl_virt'.

drivers/net/ethernet/qlogic/qed/qed_chain.c
   249  static int qed_chain_alloc_pbl(struct qed_dev *cdev, struct qed_chain *chain)
   250  {
   251          struct device *dev = &cdev->pdev->dev;
   252          struct addr_tbl_entry *addr_tbl;
   253          dma_addr_t phys, pbl_phys;
   254          __le64 *pbl_virt;
                ^^^^^^^^^^^^^^^^

   255          u32 page_cnt, i;
   256          size_t size;
   257          void *virt;
   258  
   259          page_cnt = chain->page_cnt;
   260  
   261          size = array_size(page_cnt, sizeof(*addr_tbl));
   262          if (unlikely(size == SIZE_MAX))
   263                  return -EOVERFLOW;
   264  
   265          addr_tbl = vzalloc(size);
   266          if (!addr_tbl)
   267                  return -ENOMEM;
   268  
   269          chain->pbl.pp_addr_tbl = addr_tbl;
   270  
   271          if (chain->b_external_pbl)
   272                  goto alloc_pages;
                        ^^^^^^^^^^^^^^^^
uninitialized

   273  
   274          size = array_size(page_cnt, sizeof(*pbl_virt));
   275          if (unlikely(size == SIZE_MAX))
   276                  return -EOVERFLOW;
   277  
   278          pbl_virt = dma_alloc_coherent(dev, size, &pbl_phys, GFP_KERNEL);
   279          if (!pbl_virt)
   280                  return -ENOMEM;
   281  
   282          chain->pbl_sp.table_virt = pbl_virt;
   283          chain->pbl_sp.table_phys = pbl_phys;
   284          chain->pbl_sp.table_size = size;
   285  
   286  alloc_pages:
   287          for (i = 0; i < page_cnt; i++) {
   288                  virt = dma_alloc_coherent(dev, chain->page_size, &phys,
   289                                            GFP_KERNEL);
   290                  if (!virt)
   291                          return -ENOMEM;
   292  
   293                  if (i == 0) {
   294                          qed_chain_init_mem(chain, virt, phys);
   295                          qed_chain_reset(chain);
   296                  }
   297  
   298                  /* Fill the PBL table with the physical address of the page */
   299                  pbl_virt[i] = cpu_to_le64(phys);
                        ^^^^^^^^^^^
   300  
   301                  /* Keep the virtual address of the page */
   302                  addr_tbl[i].virt_addr = virt;
   303                  addr_tbl[i].dma_map = phys;
   304          }
   305  
   306          return 0;
   307  }

regards,
dan carpenter

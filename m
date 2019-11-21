Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99811104F82
	for <lists+kernel-janitors@lfdr.de>; Thu, 21 Nov 2019 10:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUJob (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 21 Nov 2019 04:44:31 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37608 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUJob (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Nov 2019 04:44:31 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAL9d6V0090248;
        Thu, 21 Nov 2019 09:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=O9XdDweROetd4IF3Ov+XTajbGB7bCaFY1hPRXJfDoGE=;
 b=cLwpX/MOrZMlMB4pCTU4J/KveeacdfblBeboEfYiXK9XsAhECK4BC4LJlqy6R+MKlu7/
 pPXVBK/Abs/kbOk/5FW0R6I+xxm4V/vL2IRguJn4/Rskeg2Y7QlEGotU51Cx8rFrCN42
 jSQIGHLZJW8VHmunzdrnQFhuxqOyiPZDBTJWDkeXTNyY7SPbf76oGpdulbez+g+JFGS0
 PL9A1uqgTyBaKbKCACv6Yvk1ELQZUEh0LDyA+I65owLOdhQBiei5uXJBMb2FkQcN+6UW
 wbAyRYxQcpKa+KLCU3WBp0uFtluepldkONvSumCDwCP76emld92/J7h9Fp0EcnqmxVyc 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2wa92q2ygy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Nov 2019 09:44:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAL9cINU172447;
        Thu, 21 Nov 2019 09:44:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2wda05phkx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Nov 2019 09:44:27 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAL9iQVn024050;
        Thu, 21 Nov 2019 09:44:26 GMT
Received: from kili.mountain (/41.210.154.230)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 21 Nov 2019 01:44:26 -0800
Date:   Thu, 21 Nov 2019 12:44:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     cjacob@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Dump current resource provisioning status
Message-ID: <20191121094419.ktgp5w4r7mhclzet@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9447 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=974
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911210088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9447 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911210088
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Christina Jacob,

The patch 23205e6d06d4: "octeontx2-af: Dump current resource
provisioning status" from Nov 14, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:167 rvu_dbg_rsrc_attach_status()
	warn: was precision intended? '(index - 1) * 2'

drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
   143  static ssize_t rvu_dbg_rsrc_attach_status(struct file *filp,
   144                                            char __user *buffer,
   145                                            size_t count, loff_t *ppos)
   146  {
   147          int index, off = 0, flag = 0, go_back = 0, off_prev;
   148          struct rvu *rvu = filp->private_data;
   149          int lf, pf, vf, pcifunc;
   150          struct rvu_block block;
   151          int bytes_not_copied;
   152          int buf_size = 2048;
   153          char *buf;
   154  
   155          /* don't allow partial reads */
   156          if (*ppos != 0)
   157                  return 0;
   158  
   159          buf = kzalloc(buf_size, GFP_KERNEL);
   160          if (!buf)
   161                  return -ENOSPC;
   162          off +=  scnprintf(&buf[off], buf_size - 1 - off, "\npcifunc\t\t");
   163          for (index = 0; index < BLK_COUNT; index++)
   164                  if (strlen(rvu->hw->block[index].name))
   165                          off +=  scnprintf(&buf[off], buf_size - 1 - off,
   166                                            "%*s\t", (index - 1) * 2,
   167                                            rvu->hw->block[index].name);

This is a static checker false positive, because width is clearly
intended but on the first iteration throught the loop the precision
is -2 which is sort of weird.

Each column here would be 2 charaters wider than the last.  That's also
sort of weird.

The other comment that I have here is that the -1 in "buf_size - 1 -
off" is not required.  scnprintf() will always ensure that the string
is NUL terminated.

   168          off += scnprintf(&buf[off], buf_size - 1 - off, "\n");
   169          for (pf = 0; pf < rvu->hw->total_pfs; pf++) {
   170                  for (vf = 0; vf <= rvu->hw->total_vfs; vf++) {
   171                          pcifunc = pf << 10 | vf;
   172                          if (!pcifunc)
   173                                  continue;
   174  

regards,
dan carpenter

Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E72C109DD9
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbfKZMXD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:23:03 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:51532 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728340AbfKZMXD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:23:03 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCMxCB107491;
        Tue, 26 Nov 2019 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=sTCW7+ozfigiVLz+5Is58J8mS6cJcWQNWFpLkQA9bRs=;
 b=YHKmO/c4brNjSwvenwjJxpgr8HZy+w6azrSYuoMTe3rNRpUwlCzSj/b8R+jnDbqPnV1F
 ULC3KxdEIymg/FXJIn71DBvwR8lG5nKhU8mEsqsp3Z0Fx20VZNmyJe5x9drSmSfB+Wv1
 tAI3FYnFud75z+BBAS1lxZexzMf/s68M7NBZd7bfaC1Y170dE4R9Kzq3nak3+HY3/s0Z
 6JlfTt9Gy2bkfnnY+OFbA9oNLNlKCuBJ2eoSXrga6WDv39dSDsaY8SLUTZGxpiD15qSu
 SsF18kQ7/2vEF0RRla+MW4qwJJ2txaYoE+AkKOn/WkgJIzfWmo6ukSjfesKwG8yL92+G cA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2wewdr6bjh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:23:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8Qad089329;
        Tue, 26 Nov 2019 12:23:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2wgvfjdxks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:22:59 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQCMxw2007789;
        Tue, 26 Nov 2019 12:22:59 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Nov 2019 04:22:58 -0800
Date:   Tue, 26 Nov 2019 15:22:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     cjacob@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Dump current resource provisioning status
Message-ID: <20191126122252.bayz6jfencfm4yby@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=656
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=713 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Christina Jacob,

The patch 23205e6d06d4: "octeontx2-af: Dump current resource
provisioning status" from Nov 14, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:215 rvu_dbg_rsrc_attach_status()
	warn: userbuf overflow? is 'off' <= 'count'

drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
   143  static ssize_t rvu_dbg_rsrc_attach_status(struct file *filp,
   144                                            char __user *buffer,
   145                                            size_t count, loff_t *ppos)
                                                  ^^^^^^^^^^^^
The user has a buffer "count" bytes large.

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
   168          off += scnprintf(&buf[off], buf_size - 1 - off, "\n");
   169          for (pf = 0; pf < rvu->hw->total_pfs; pf++) {
   170                  for (vf = 0; vf <= rvu->hw->total_vfs; vf++) {
   171                          pcifunc = pf << 10 | vf;
   172                          if (!pcifunc)
   173                                  continue;
   174  
   175                          if (vf) {
   176                                  go_back = scnprintf(&buf[off],
   177                                                      buf_size - 1 - off,
   178                                                      "PF%d:VF%d\t\t", pf,
   179                                                      vf - 1);
   180                          } else {
   181                                  go_back = scnprintf(&buf[off],
   182                                                      buf_size - 1 - off,
   183                                                      "PF%d\t\t", pf);
   184                          }
   185  
   186                          off += go_back;
   187                          for (index = 0; index < BLKTYPE_MAX; index++) {
   188                                  block = rvu->hw->block[index];
   189                                  if (!strlen(block.name))
   190                                          continue;
   191                                  off_prev = off;
   192                                  for (lf = 0; lf < block.lf.max; lf++) {
   193                                          if (block.fn_map[lf] != pcifunc)
   194                                                  continue;
   195                                          flag = 1;
   196                                          off += scnprintf(&buf[off], buf_size - 1
   197                                                          - off, "%3d,", lf);
   198                                  }
   199                                  if (flag && off_prev != off)
   200                                          off--;
   201                                  else
   202                                          go_back++;
   203                                  off += scnprintf(&buf[off], buf_size - 1 - off,
   204                                                  "\t");
   205                          }
   206                          if (!flag)
   207                                  off -= go_back;
   208                          else
   209                                  flag = 0;
   210                          off--;
   211                          off +=  scnprintf(&buf[off], buf_size - 1 - off, "\n");
   212                  }
   213          }
   214  
   215          bytes_not_copied = copy_to_user(buffer, buf, off);
                                                             ^^^
So we need to ensure that we don't copy more than "count" bytes into it.

   216          kfree(buf);
   217  
   218          if (bytes_not_copied)
   219                  return -EFAULT;
   220  
   221          *ppos = off;
   222          return off;

regards,
dan carpenter

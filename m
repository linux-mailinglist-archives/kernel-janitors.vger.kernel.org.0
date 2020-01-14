Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3757213AF4E
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2020 17:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgANQ1s (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jan 2020 11:27:48 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:36580 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgANQ1s (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jan 2020 11:27:48 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00EGOLtL062079;
        Tue, 14 Jan 2020 16:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Szp+fenuVidVKCwoLovB578DWbHbG8s4Yk8KG/WNI9s=;
 b=rQoz3TPZXaqDhqkNzigF65xvxKM/gQVDNP4gbF5e+AvdLWkNDloV68LhNYRhuba5y9ug
 ycLFsls33Sqt90NYZP/Yi0ULow0elpP1deDAcJCZiHPHd5RrjTw8DHebNRXyhHRzrhXB
 JXRfaaC9krIJqRp8E8f1OF9w1v2I80bvLvFWbn9Ha7QiOLNo1XmEFEGlRxgtJqgKHEFt
 I2w+02gOYp8qFmH98r8cMPFiDHr5hkGLa62J7EO+jEjdRIwZHsVAn7FArrDlk+TFxWAM
 fO3hXyN2v3iMBSwstrqrwCTzPXNkaHfcM4sh7ynAK95RbLsibQHzKyhkMFdjYEWZxapk Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xf73yf340-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 16:27:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00EG9OCC008538;
        Tue, 14 Jan 2020 16:27:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xh2scu9f5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 16:27:44 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00EGRiUp003351;
        Tue, 14 Jan 2020 16:27:44 GMT
Received: from kadam (/10.175.194.72)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jan 2020 08:27:39 -0800
Date:   Tue, 14 Jan 2020 19:27:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Colin King <colin.king@canonical.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: syzbot is quite fun
Message-ID: <20200114162736.GD3719@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140137
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Everyone,

I joined the syzbot mailing list last week.  It seems quite fun.

I'm puzzling over this one right now.

https://syzkaller.appspot.com/bug?extid=9a48339b077c5a80b869

Notice the kernel is 5.5.0-rc3-syzkaller (git checkout v5.5-rc3).

  1801  static int uvc_scan_device(struct uvc_device *dev)
  1802  {
  1803          struct uvc_video_chain *chain;
  1804          struct uvc_entity *term;
  1805  
  1806          list_for_each_entry(term, &dev->entities, list) {
  1807                  if (!UVC_ENTITY_IS_OTERM(term))
  1808                          continue;
  1809  
  1810                  /* If the terminal is already included in a chain, skip it.
  1811                   * This can happen for chains that have multiple output
  1812                   * terminals, where all output terminals beside the first one
  1813                   * will be inserted in the chain in forward scans.
  1814                   */
  1815                  if (term->chain.next || term->chain.prev)
  1816                          continue;
  1817  
  1818                  chain = uvc_alloc_chain(dev);
  1819                  if (chain == NULL)
  1820                          return -ENOMEM;
  1821  
  1822                  term->flags |= UVC_ENTITY_FLAG_DEFAULT;
  1823  
  1824                  if (uvc_scan_chain(chain, term) < 0) {
  1825                          kfree(chain);
                                      ^^^^^
Somehow this "chain" is used after it has been freed.  That doesn't
seem possible because uvc_scan_chain() doesn't store any reference to
it.

  1826                          continue;
  1827                  }
  1828  
  1829                  uvc_trace(UVC_TRACE_PROBE, "Found a valid video chain (%s).\n",
  1830                            uvc_print_chain(chain));
  1831  
  1832                  list_add_tail(&chain->list, &dev->chains);
  1833          }

Its like solving a puzzle.  Reviewing code skills etc.

regards,
dan carpenter


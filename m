Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992EB2C596
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 May 2019 13:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfE1LlJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 28 May 2019 07:41:09 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:57602 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbfE1LlJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 May 2019 07:41:09 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SBcadL087846;
        Tue, 28 May 2019 11:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=MN57hUpgpY3H8YYlVbmW+Gv7AfB2kO8pYtNwkuwN+/s=;
 b=bqH7Zxhp/r+ta6PK14bhgjZ/gfjk9KYqLJsjZAbCB7e/FOHogopDZpD30rjvlDGXa8Vr
 vg+p7UGbugFzgPAkaScQNtnuCH6ODEu0d+FlgGqiTU8Y7YQNfx+HahWPIy4RGfmDATJs
 QfUvXk9w5m1eiVSvGyCWMTwpIFod9k41OROXIo9mq/xbSFVyhdzhnKzjdptiq703hyX7
 G3UVp3WiQgy0NOVowEdTqmSVHcWHirjUzrrhlCKXf3BTHEg2VP4ekoqmnLrCcFM9vOzs
 eW+jpH2ueXA7kyMBhLd/k/aV3acLkoVFuTPcDfEmTjDYz74L1313Y9KfXeTpc2LK4E4w UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2spxbq2abn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 May 2019 11:41:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SBc7TV127367;
        Tue, 28 May 2019 11:39:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2srbdwr379-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 May 2019 11:39:05 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4SBd44K014541;
        Tue, 28 May 2019 11:39:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 May 2019 04:39:03 -0700
Date:   Tue, 28 May 2019 14:38:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     alexandre.bounine@idt.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] rapidio: add mport char device driver
Message-ID: <20190528113858.GA6670@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905280077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280077
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Alexandre Bounine,

The patch e8de370188d0: "rapidio: add mport char device driver" from
Mar 22, 2016, leads to the following static checker warning:

	drivers/rapidio/devices/rio_mport_cdev.c:1694 rio_mport_add_riodev()
	warn: '__dynamic_pr_debug' unterminated user string 'dev_info.name'

drivers/rapidio/devices/rio_mport_cdev.c
  1676  static int rio_mport_add_riodev(struct mport_cdev_priv *priv,
  1677                                     void __user *arg)
  1678  {
  1679          struct mport_dev *md = priv->md;
  1680          struct rio_rdev_info dev_info;
  1681          struct rio_dev *rdev;
  1682          struct rio_switch *rswitch = NULL;
  1683          struct rio_mport *mport;
  1684          size_t size;
  1685          u32 rval;
  1686          u32 swpinfo = 0;
  1687          u16 destid;
  1688          u8 hopcount;
  1689          int err;
  1690  
  1691          if (copy_from_user(&dev_info, arg, sizeof(dev_info)))
                                    ^^^^^^^^
  1692                  return -EFAULT;
  1693  
  1694          rmcd_debug(RDEV, "name:%s ct:0x%x did:0x%x hc:0x%x", dev_info.name,
                                                                     ^^^^^^^^^^^^^
The user might have forgotten to NUL terminate this string.

  1695                     dev_info.comptag, dev_info.destid, dev_info.hopcount);
  1696  
  1697          if (bus_find_device_by_name(&rio_bus_type, NULL, dev_info.name)) {
  1698                  rmcd_debug(RDEV, "device %s already exists", dev_info.name);
  1699                  return -EEXIST;
  1700          }

regards,
dan carpenter

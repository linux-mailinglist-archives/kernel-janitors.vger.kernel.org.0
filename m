Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CFC38607
	for <lists+kernel-janitors@lfdr.de>; Fri,  7 Jun 2019 10:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfFGISy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 7 Jun 2019 04:18:54 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:54862 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfFGISx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jun 2019 04:18:53 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x578DiIO129565;
        Fri, 7 Jun 2019 08:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=y5L30cCKUUP+XeQ2Tt17vPX73ojwwq5JkZm1FKEilVQ=;
 b=KGDmJu1Pf3eo/32wmuPxs8A2MlSUXQAblWDQDPpx6PyJjIH0V8PJ5tlFDgTLNv6VbWGM
 g9x9ICoB/bzl4p4oNBkHts8qydZse/a0B+LF+h7AUv/fMj6lWcDklokRQnpBzvaXJ0Ow
 1WOF3/Vbn9yretE/7/iKMshOsMD2lGllleFld1ZUZLBB7+jZht00imoJqdmQrJArG4sT
 F3ovUfDSeIBJswiTcwZ2ON2BlV8vijfPvckt4eYd6QxujE1xtUL+hRDpUNwjqhmJr95d
 +MAIAvKz7KkErLIPPUvGfHaLOpfbR6T9+QXySeX92KgpxMDmh8MVmw12AaIzXXpwys0R 4w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2suevdw42e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 08:18:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x578Il30101536;
        Fri, 7 Jun 2019 08:18:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2swnhd4pnw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 08:18:48 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x578IlWT027028;
        Fri, 7 Jun 2019 08:18:47 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Jun 2019 01:18:47 -0700
Date:   Fri, 7 Jun 2019 11:18:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ncrews@chromium.org
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] platform/chrome: wilco_ec: Add event handling
Message-ID: <20190607081841.GA27206@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=863
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=901 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070059
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Nick Crews,

The patch f7b0bc5eafa4: "platform/chrome: wilco_ec: Add event
handling" from May 23, 2019, leads to the following static checker
warning:

  drivers/platform/chrome/wilco_ec/event.c:352 event_read()
  warn: inconsistent returns 'dev_data->lock'.
    Locked on  : 345
    Unlocked on: 323,333,352

drivers/platform/chrome/wilco_ec/event.c
   306  static ssize_t event_read(struct file *filp, char __user *buf, size_t count,
   307                            loff_t *pos)
   308  {
   309          struct event_device_data *dev_data = filp->private_data;
   310          struct ec_event_entry *entry;
   311          ssize_t n_bytes_written = 0;
   312          int err;
   313  
   314          /* We only will give them the entire event at once */
   315          if (count != 0 && count < EC_ACPI_MAX_EVENT_SIZE)
   316                  return -EINVAL;
   317  
   318          mutex_lock(&dev_data->lock);
   319  
   320          while (dev_data->num_events == 0) {
   321                  if (filp->f_flags & O_NONBLOCK) {
   322                          mutex_unlock(&dev_data->lock);
   323                          return -EAGAIN;
   324                  }
   325                  /* Need to unlock so that data can actually get added to the
   326                   * queue, and since we recheck before use and it's just
   327                   * comparing pointers, this is safe unlocked.
   328                   */
   329                  mutex_unlock(&dev_data->lock);
   330                  err = wait_event_interruptible(dev_data->wq,
   331                                                 dev_data->num_events);
   332                  if (err)
   333                          return err;
   334  
   335                  /* Device was removed as we waited? */
   336                  if (!dev_data->exist)
   337                          return -ENODEV;
   338                  mutex_lock(&dev_data->lock);
   339          }
   340  
   341          entry = list_first_entry(&dev_data->events,
   342                                   struct ec_event_entry, list);
   343          n_bytes_written = entry->size;
   344          if (copy_to_user(buf, &entry->event, n_bytes_written))
   345                  return -EFAULT;

We need to unlock here.  But also maybe we should do other error
handling like the list_del() as well?  I'm not sure.

   346          list_del(&entry->list);
   347          kfree(entry);
   348          dev_data->num_events--;
   349  
   350          mutex_unlock(&dev_data->lock);
   351  
   352          return n_bytes_written;
   353  }

regards,
dan carpenter

Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27CF9DD78A
	for <lists+kernel-janitors@lfdr.de>; Sat, 19 Oct 2019 10:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfJSIzD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 19 Oct 2019 04:55:03 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37824 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfJSIzD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Oct 2019 04:55:03 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9J8rbq8134084;
        Sat, 19 Oct 2019 08:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=45hdb7W37yenlGgLivIS201/P5W4zQe6frrsq4YDs/A=;
 b=JPYNycr4OvIOTCMquESLCZR+SlU9KWCKn3UnDZvNQxDrXHzSbki8xPVfJr8/YaGGx32/
 XFIvkba2PTyJXcT35KhZkmkNaZQTSofQvP2iRaH8xAh9J4Gg9dMaQhKottu17UmC+WeB
 qawChUGpLJiqRG9Ru9MZ0MSfvJf89FGv9twigGB8F3oSx2O56NJ8Uw/GI5HPsooJ46Mu
 XdMMMpWYtTkNJ9hWOSrmhZQJKfXOp7wTy2lz0rOu6t69/f8RZqwp+ukmUQxM1LkfPhBj
 XCfYnpZ0YmTKoLUtPrk90X0YkVgZXvVh7bN5Ei3UyE1RwJVn1Ebsj8SJrgKhqZyYZ1pt zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2vqswt0t65-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 19 Oct 2019 08:54:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9J8s5SD142116;
        Sat, 19 Oct 2019 08:54:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2vqsu7j1jk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 19 Oct 2019 08:54:58 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9J8svbM018596;
        Sat, 19 Oct 2019 08:54:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 19 Oct 2019 08:54:56 +0000
Date:   Sat, 19 Oct 2019 11:54:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     oneukum@suse.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] usb: hso: obey DMA rules in tiocmget
Message-ID: <20191019085451.GA13915@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9414 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=915
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910190078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9414 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=992 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910190078
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Oliver Neukum,

The patch af0de1303c4e: "usb: hso: obey DMA rules in tiocmget" from
Oct 17, 2019, leads to the following static checker warning:

	drivers/net/usb/hso.c:2626 hso_create_bulk_serial_device()
	warn: variable dereferenced before check 'serial->tiocmget' (see line 2620)

drivers/net/usb/hso.c
  2615  
  2616          if ((port & HSO_PORT_MASK) == HSO_PORT_MODEM) {
  2617                  num_urbs = 2;
  2618                  serial->tiocmget = kzalloc(sizeof(struct hso_tiocmget),
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
Allocation

  2619                                             GFP_KERNEL);
  2620                  serial->tiocmget->serial_state_notification
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

  2621                          = kzalloc(sizeof(struct hso_serial_state_notification),
  2622                                             GFP_KERNEL);
  2623                  /* it isn't going to break our heart if serial->tiocmget
  2624                   *  allocation fails don't bother checking this.
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Comment says not to check for failure.

  2625                   */
  2626                  if (serial->tiocmget && serial->tiocmget->serial_state_notification) {
                            ^^^^^^^^^^^^^^^^
Check too late.

  2627                          tiocmget = serial->tiocmget;
  2628                          tiocmget->endp = hso_get_ep(interface,
  2629                                                      USB_ENDPOINT_XFER_INT,
  2630                                                      USB_DIR_IN);
  2631                          if (!tiocmget->endp) {
  2632                                  dev_err(&interface->dev, "Failed to find INT IN ep\n");
  2633                                  goto exit;
  2634                          }
  2635  
  2636                          tiocmget->urb = usb_alloc_urb(0, GFP_KERNEL);
  2637                          if (tiocmget->urb) {
  2638                                  mutex_init(&tiocmget->mutex);
  2639                                  init_waitqueue_head(&tiocmget->waitq);
  2640                          } else
  2641                                  hso_free_tiomget(serial);
  2642                  }
  2643          }
  2644          else
  2645                  num_urbs = 1;


regards,
dan carpenter

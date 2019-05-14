Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D8A1D106
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 May 2019 23:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfENVI7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 May 2019 17:08:59 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41056 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfENVI6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 May 2019 17:08:58 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4EKrwZg145180;
        Tue, 14 May 2019 21:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ixo4o+aSEeEb0s9/qUyWyLCsMY9PE905awaL8jZwuj0=;
 b=bWdPFwB8t634T//ysXfoR9gb5HG6C313LX5Zk9xjj/LybzTnzNUHBPrfYBzcmnVt6KRk
 ugo0QVoGpnh4jAPWr+Ejp9qCsSGTLA1AZnF3e4D02Qb/VAvE+8BYboMgfd1S95G9q//U
 wKkZLuBhu2Fbmxlga7OWb+RmanlqyOwc/L5BFpc/SVPb2cT8vcrGOtifp/udIS9tMcvT
 dG8qSeeOjkRBOVkpwqYCnHsmvqauQsCu63Ynh7wsKLAXMbfnMmxa//gJvnU04j0buBkX
 uA4GsEy+X94CzByryiekDIsK9+xWgBSxNjS6FbEq5xn0YFQFVTisaJyb8MF0iLOwNykd vA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2sdq1qgsnj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 21:08:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4EL7dZ8020756;
        Tue, 14 May 2019 21:08:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2sdnqjtkpw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 21:08:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4EL8r7d029463;
        Tue, 14 May 2019 21:08:53 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 May 2019 14:08:52 -0700
Date:   Wed, 15 May 2019 00:08:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rushikesh.s.kadam@intel.com
Cc:     Guenter Roeck <groeck@chromium.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] platform/chrome: Add ChromeOS EC ISHTP driver
Message-ID: <20190514210846.GA6848@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=894
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905140139
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=918 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905140139
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Rushikesh S Kadam,

The patch 4f346361cf42: "platform/chrome: Add ChromeOS EC ISHTP
driver" from May 4, 2019, leads to the following static checker
warning:

drivers/platform/chrome/cros_ec_ishtp.c:527 cros_ec_pkt_xfer_ish()
warn: inconsistent returns 'read_sem:&init_lock'.
  Locked on:   line 475
               line 482
  Unlocked on: line 467
               line 527

drivers/platform/chrome/cros_ec_ishtp.c
   450  static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
   451                                  struct cros_ec_command *msg)
   452  {
   453          int rv;
   454          struct ishtp_cl *cros_ish_cl = ec_dev->priv;
   455          struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
   456          struct device *dev = cl_data_to_dev(client_data);
   457          struct cros_ish_in_msg *in_msg = (struct cros_ish_in_msg *)ec_dev->din;
   458          struct cros_ish_out_msg *out_msg =
   459                  (struct cros_ish_out_msg *)ec_dev->dout;
   460          size_t in_size = sizeof(struct cros_ish_in_msg) + msg->insize;
   461          size_t out_size = sizeof(struct cros_ish_out_msg) + msg->outsize;
   462  
   463          /* Proceed only if reset-init is not in progress */
   464          if (!down_read_trylock(&init_lock)) {
   465                  dev_warn(dev,
   466                           "Host is not ready to send messages to ISH. Try again\n");
   467                  return -EAGAIN;
   468          }
   469  
   470          /* Sanity checks */
   471          if (in_size > ec_dev->din_size) {
   472                  dev_err(dev,
   473                          "Incoming payload size %zu is too large for ec_dev->din_size %d\n",
   474                          in_size, ec_dev->din_size);
   475                  return -EMSGSIZE;
                        ^^^^^^^^^^^^^^^^^
   476          }
   477  
   478          if (out_size > ec_dev->dout_size) {
   479                  dev_err(dev,
   480                          "Outgoing payload size %zu is too large for ec_dev->dout_size %d\n",
   481                          out_size, ec_dev->dout_size);
   482                  return -EMSGSIZE;
                        ^^^^^^^^^^^^^^^^^
Could we move these sanity checks to before we take the lock?  Otherwise
we need to goto end_error;

   483          }
   484  
   485          /* Prepare the package to be sent over ISH TP */
   486          out_msg->hdr.channel = CROS_EC_COMMAND;
   487          out_msg->hdr.status = 0;
   488  
   489          ec_dev->dout += OUT_MSG_EC_REQUEST_PREAMBLE;
   490          cros_ec_prepare_tx(ec_dev, msg);
   491          ec_dev->dout -= OUT_MSG_EC_REQUEST_PREAMBLE;
   492  
   493          dev_dbg(dev,
   494                  "out_msg: struct_ver=0x%x checksum=0x%x command=0x%x command_ver=0x%x data_len=0x%x\n",
   495                  out_msg->ec_request.struct_version,
   496                  out_msg->ec_request.checksum,
   497                  out_msg->ec_request.command,
   498                  out_msg->ec_request.command_version,
   499                  out_msg->ec_request.data_len);
   500  
   501          /* Send command to ISH EC firmware and read response */
   502          rv = ish_send(client_data,
   503                        (u8 *)out_msg, out_size,
   504                        (u8 *)in_msg, in_size);
   505          if (rv < 0)
   506                  goto end_error;
   507  
   508          rv = prepare_cros_ec_rx(ec_dev, in_msg, msg);
   509          if (rv)
   510                  goto end_error;
   511  
   512          rv = in_msg->ec_response.data_len;
   513  
   514          dev_dbg(dev,
   515                  "in_msg: struct_ver=0x%x checksum=0x%x result=0x%x data_len=0x%x\n",
   516                  in_msg->ec_response.struct_version,
   517                  in_msg->ec_response.checksum,
   518                  in_msg->ec_response.result,
   519                  in_msg->ec_response.data_len);
   520  
   521  end_error:
   522          if (msg->command == EC_CMD_REBOOT_EC)
   523                  msleep(EC_REBOOT_DELAY_MS);
   524  
   525          up_read(&init_lock);
   526  
   527          return rv;
   528  }

regards,
dan carpenter

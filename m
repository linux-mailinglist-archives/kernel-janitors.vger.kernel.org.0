Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9F6109DD4
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfKZMWb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:22:31 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50828 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfKZMWb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:22:31 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCMMbG106952;
        Tue, 26 Nov 2019 12:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1LIUgwVGgXvbct9bRbo/IDCWnPRyVjeNB6V0pgBXOJU=;
 b=PME7w8WYDf00AJrTkkEspbqKJ7aU82e2nSEf8ts7YbH6G1IlkjuAY2o+D38X4JuiEsYy
 Jio2nJMWCuhWXLOHmkKIui7T0fqMQOiO8eijZz0iqNRz0XIjZ2K2A+06OSMqglc7qIc1
 bh+x9YfeT82CiLJdr4Fkl8hEExqFlO7IcG2g9R9+Rz3cmSOCCBbs1EghjOs+0rvuPmrC
 ZnVUXAur5LTFy+6ry6E6osvW5CMZiWtr/XoJJvZK9qXBGa+RTTR0eX5Hi3DQ2BFf4Z5R
 1f3cfAQcGw8KzzUrE8qdiGSp700UOTpV26FAnNqFtOuNoaP/mVsvtEp0IZm4QBKz9cAE AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2wewdr6bfu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:22:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8XCm050177;
        Tue, 26 Nov 2019 12:22:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2wgwush4ma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Nov 2019 12:22:26 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQCMQfN001753;
        Tue, 26 Nov 2019 12:22:26 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Nov 2019 04:22:25 -0800
Date:   Tue, 26 Nov 2019 15:22:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sgarzare@redhat.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] vsock: add multi-transports support
Message-ID: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=926
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=981 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Stefano Garzarella,

This is a semi-automatic email about new static checker warnings.

The patch c0cfa2d8a788: "vsock: add multi-transports support" from 
Nov 14, 2019, leads to the following Smatch complaint:

    net/vmw_vsock/af_vsock.c:1014 vsock_poll()
     error: we previously assumed 'transport' could be null (see line 987)

net/vmw_vsock/af_vsock.c
   986			/* If there is something in the queue then we can read. */
   987			if (transport && transport->stream_is_active(vsk) &&
                            ^^^^^^^^^
The patch adds a check for transport.

   988			    !(sk->sk_shutdown & RCV_SHUTDOWN)) {
   989				bool data_ready_now = false;
   990				int ret = transport->notify_poll_in(
   991						vsk, 1, &data_ready_now);
   992				if (ret < 0) {
   993					mask |= EPOLLERR;
   994				} else {
   995					if (data_ready_now)
   996						mask |= EPOLLIN | EPOLLRDNORM;
   997	
   998				}
   999			}
  1000	
  1001			/* Sockets whose connections have been closed, reset, or
  1002			 * terminated should also be considered read, and we check the
  1003			 * shutdown flag for that.
  1004			 */
  1005			if (sk->sk_shutdown & RCV_SHUTDOWN ||
  1006			    vsk->peer_shutdown & SEND_SHUTDOWN) {
  1007				mask |= EPOLLIN | EPOLLRDNORM;
  1008			}
  1009	
  1010			/* Connected sockets that can produce data can be written. */
  1011			if (sk->sk_state == TCP_ESTABLISHED) {
  1012				if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
  1013					bool space_avail_now = false;
  1014					int ret = transport->notify_poll_out(
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
But it's not checked here.  I guess probably TCP_ESTABLISHED means that
transport is non-NULL?  If so then just ignore the warning.

  1015							vsk, 1, &space_avail_now);
  1016					if (ret < 0) {

regards,
dan carpenter

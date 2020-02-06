Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B815463A
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Feb 2020 15:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgBFOby (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 6 Feb 2020 09:31:54 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:36838 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727901AbgBFObx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Feb 2020 09:31:53 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 016AxBub145467;
        Thu, 6 Feb 2020 10:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=w09p7tlCIrGYDhB5lpsrxt1zv65FGzaCpUhRxemID5I=;
 b=cCtSVyVrl6vUK9bDW0NaPsJaSAUFen9vm4UlsVWfjPsNxmDURKOK2Oa5ioAnZFVBG5mC
 B7pUo3h72H2nfOTw4+8FSU9qkZU+l+MrYBLQtaFFLQgjOSiMQvUO/+aSFGdfz3yxLfKA
 WKzYYa1IKZDQXU9N3KCd5jg4NYsPCm+Vc//bUTjhYJWdi2uvNxVyNp0NwyPzJjBaJnV+
 k5a0jWYQS66QiDWvCpGZnqKoPXTTzsFzrKFnb5Dk9rfFKeS1ipq4IIwuTt2CVrHEeazU
 nruNSCXTbj6xX2tuD7C7+S0PO0fFEeyuF5XgjJDUUhRpOPfK9ChPbLcb965jzjbaLfa5 kA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=w09p7tlCIrGYDhB5lpsrxt1zv65FGzaCpUhRxemID5I=;
 b=ch+lnRkHGiO0f32ehfBetfzm+CKoO7YJ4nghIaopfFOG6m4Q89cEqErP6zdvxVKwbp2N
 N7dR6sUX9Sxv3SOoEkDx9x5ih3lN5FXVcCLXNsddpHzB4US5/H/KIxEA3UQ5ckp0d+5E
 LFzD/K10vFYWJi8ovN7HZ2gvUgOrD5HZ5CjUMGKoCyQh/m9As7sSDtTUePpljvxQ27Bu
 mrioL7YnH18gM4Bw/U/IbNbJqpb0XuXqb/TEcY93ncBVp5J/vLArETLWTc8l+3BYwO4Y
 jPeb8Dmwdna7jPnQaQEgn0guzwtCNB8vq0OuKUa1MKGVesK9v/aLq9e4zvJdnTE520Vb XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xykbp8wky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Feb 2020 10:59:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 016AxKIU104640;
        Thu, 6 Feb 2020 10:59:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xykc5c84t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Feb 2020 10:59:36 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 016AxRJe004729;
        Thu, 6 Feb 2020 10:59:27 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 Feb 2020 02:59:27 -0800
Date:   Thu, 6 Feb 2020 13:59:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     Lauri Jakku <lja@iki.fi>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v6] USB: HID: random timeout failures tackle try.
Message-ID: <20200206105921.GI24804@kadam>
References: <20200205153944.11955-1-lja@iki.fi>
 <20200205171230.GV1778@kadam>
 <14bdd24e-1e69-60b4-f5f6-2def804710c1@pp.inet.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14bdd24e-1e69-60b4-f5f6-2def804710c1@pp.inet.fi>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=784
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002060083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9522 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=863 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002060083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 06, 2020 at 12:37:44PM +0200, Lauri Jakku wrote:
> .. this is my first time patching kernel publicly so, I'm not used to
> 
> the Proper way, but i'm learning all the time :)
> 

Absolutely no problem.  If you want to resend to kernel-janitors instead
of linux-input and linux-usb until it's a little bit more polished
you're totally welcome to do that as well.

We have a lot of experience in merging patch and style issues (but
probably not as much USB knowledge).

regards,
dan carpenter

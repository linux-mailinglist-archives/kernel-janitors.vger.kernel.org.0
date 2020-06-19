Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991FF2009FC
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jun 2020 15:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732813AbgFSNZr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Jun 2020 09:25:47 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55818 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbgFSNZo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Jun 2020 09:25:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05JDHA33050202;
        Fri, 19 Jun 2020 13:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=FVXkHIRRaqRBu+bg+o5FU7sEhy5DvuhQuDeGuapHRpg=;
 b=y/Xy0toCsfOKakBG6QuJsl+dYxZn0v/NA4HSS452aEa31i92UYjSpDRY/DvfymqA28iH
 jWFs+40nv+9+TzXkSLYs3f4etZ3Q5i00aXFFzDCX/ULP9xySX5imvNh8Ym+CRqoxM3q8
 i8pydSqjIxLIIIo/i5lvVQQcvqlQeV2kXNm76t5ZyEyfP4bq5ykxxpVN7bwhcPyhZ9OW
 A/E1vPUTqI5r0u4+glw+S56U/EIeYd7Zl5Bv3X3X6EKXijFuLUK3S9mzfq8YPMxn5W9D
 aZlAKq3YA713rmp7xZDcRycZX/dlEcYqKrbsKZvPbCIa5tSeazE3E8/fp29Ud0tVjbtC /Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 31qecm58y9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 19 Jun 2020 13:25:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05JDJHP4143610;
        Fri, 19 Jun 2020 13:25:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 31q66rgd3f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Jun 2020 13:25:40 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05JDPdNU026961;
        Fri, 19 Jun 2020 13:25:39 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Jun 2020 06:25:39 -0700
Date:   Fri, 19 Jun 2020 16:25:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ido Schimmel <idosch@mellanox.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x
 ports
Message-ID: <20200619132534.GX4151@kadam>
References: <20200619100907.GA246319@mwanda>
 <20200619130147.GA400150@splinter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619130147.GA400150@splinter>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9656 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=987 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9656 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 cotscore=-2147483648 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006190098
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 19, 2020 at 04:01:47PM +0300, Ido Schimmel wrote:
> On Fri, Jun 19, 2020 at 01:09:07PM +0300, Dan Carpenter wrote:
> > Hello Ido Schimmel,
> > 
> > The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
> > 8x ports" from Jun 16, 2020, leads to the following static checker
> > warning:
> 
> Thanks for the report, Dan.
> 
> Colin already reported it to me and I have the below patch in my queue
> to address the issue. WDYT?

Looks good.  Thanks!

regards,
dan carpenter


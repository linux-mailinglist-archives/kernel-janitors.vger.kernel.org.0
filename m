Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D618643CBF
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbfFMPhM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:37:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58874 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfFMKNz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 06:13:55 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DADm1E188368;
        Thu, 13 Jun 2019 10:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=g/QnWL633DATk/D0Ttai9VtCMe1kqYKn1pLuJll4508=;
 b=GklY27X5+QjHhNv7ViZ+ll9KPwabeXfjDVbQz0kuhjyfnsT9ouulN23nE5+Uoc5OdBeS
 0CZHlWStZkg2S/9pEZ1vPkITGoLzIX/91OVXSP5c35hyciEMPO8r5M7X8gn5MkM+/n7I
 JsbCieUadfIrWmXshJ9jvN6LCBKWMvll6qxjPThlxessuY7lo2uxSsk3ubj+jahpOUn8
 XM4AztxNaoxMNQj9JchMrnIbjIXLanDYrVBdhWrlfEFr9VnEexeOlzTBGdHuAK+eLtS3
 AX0j95v7qi1asic0YOAiizdw9aado39rx/wFDtjtysACWB7OUaxwhlWJdDwzIAoBDQ3J kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2t05nr0hve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 10:13:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DADAkN059596;
        Thu, 13 Jun 2019 10:13:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2t0p9satu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 10:13:50 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5DADnEw006355;
        Thu, 13 Jun 2019 10:13:49 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 13 Jun 2019 03:13:48 -0700
Date:   Thu, 13 Jun 2019 13:13:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] coresight: etm: Clean up device specific data
Message-ID: <20190613101341.GH1893@kadam>
References: <20190613065518.GD16334@mwanda>
 <fda21251-6ab9-aba6-9358-b2718682d21a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda21251-6ab9-aba6-9358-b2718682d21a@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=757
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=805 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130081
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks!

regards,
dan carpenter


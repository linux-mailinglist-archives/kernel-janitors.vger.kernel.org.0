Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B50676589B
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jul 2023 18:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbjG0Q1U (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jul 2023 12:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjG0Q1S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jul 2023 12:27:18 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A781984
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jul 2023 09:27:17 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7EfaE017423;
        Thu, 27 Jul 2023 09:27:14 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3s3m13sxuc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 09:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An5ZH+bo3BjrBthENt3a11RqBHbxxa/4FvXUKNdYqsTEDnNcHMy4HtPIGBxROQ4Oh9syoUl7bqvS8ad2djFi+vFcIrAfjgX4f/MIgmpDSUvYTs1Byb/Cb8xYxlmvAaWk4ImQLir+DzBRrC7UJQ2IXKt8bfY0Cv684fRvRENZXZfrAN9u5BG9ocF9zfejUY4cPOdQwDRIFO7FP1JApkd6Xqk1nRMXt9J/F9cBwtaIeZbzd4eZKiAX4XC4VlbnvUlEmznrUUkWSTgnxvcpA3CFPuqfQCHI3cOFReuO7dkLraJmDp9sRC/bJEYndFXXJ6SH6chNRsTLHPy0feJ5cGoXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/lvUC7DWa4E7SuTthMXKFs+Lx3xfUFWbXFm5/QyzOs=;
 b=kpNrVgNojthFQViAeyeqMyzDN9i5i9hYiqHYpgfmtVupzdlTBrI8p6ArO469Y30+lPLi1hSVP10O9j0KbtvSreY4pEcdlCtUTQJ6CYQUTMy0voIDTP02oiFLbfJBG+nLg7g7feuqbwYQH4PYgiSn6CQO4TYiJsISawYZGQFXr0iMe7WDIKyBMkLbVGys9F3me1TJagexr5C9Oxl5QXTygXEgVqQX90x+fNLLPD7Yip8XusCBPhcATp1Jlwxv2Mg63OGUUs38NHBo8dSsnrWaOAXOwuoeDmh4wP5qPR2+qj1r7HuWCkZzgk8fZc8qaqPYDvB1qR+MzeSo60+6LL70YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/lvUC7DWa4E7SuTthMXKFs+Lx3xfUFWbXFm5/QyzOs=;
 b=kaxQFsKa/yOGS6PiLXkuQ819q8EuxrPaDXw2S08xsH+V5YS8WD6Z0IzoB/blxvG1huhzXWKJEZGi/+0wH3U3+jTGybY+Rou62iqvqcG30W6MdqA9A+zcGG+YqkifZwifstVNByGhglUZ1uZVe6d176toSnYfrk02AKXauciL0MU=
Received: from SJ0PR18MB5216.namprd18.prod.outlook.com (2603:10b6:a03:430::6)
 by MN6PR18MB5442.namprd18.prod.outlook.com (2603:10b6:208:477::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 16:27:11 +0000
Received: from SJ0PR18MB5216.namprd18.prod.outlook.com
 ([fe80::a86:423c:7a0e:d09b]) by SJ0PR18MB5216.namprd18.prod.outlook.com
 ([fe80::a86:423c:7a0e:d09b%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 16:27:09 +0000
From:   Suman Ghosh <sumang@marvell.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [EXT] [bug report] octeontx2-af: Install TC filter rules in
 hardware based on priority
Thread-Topic: [EXT] [bug report] octeontx2-af: Install TC filter rules in
 hardware based on priority
Thread-Index: AQHZwFQ6074v2vyAckmeK9mKIeagUa/NzWuQ
Date:   Thu, 27 Jul 2023 16:27:09 +0000
Message-ID: <SJ0PR18MB5216053462BDCF13FCB7C193DB01A@SJ0PR18MB5216.namprd18.prod.outlook.com>
References: <e5ac49d5-2f37-48a5-805f-1444bcfdab48@moroto.mountain>
In-Reply-To: <e5ac49d5-2f37-48a5-805f-1444bcfdab48@moroto.mountain>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3VtYW5nXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNmM4ODQ4NzMtMmM5YS0xMWVlLWI2ZTAtODQxNDRk?=
 =?us-ascii?Q?ZWVhNTRjXGFtZS10ZXN0XDZjODg0ODc1LTJjOWEtMTFlZS1iNmUwLTg0MTQ0?=
 =?us-ascii?Q?ZGVlYTU0Y2JvZHkudHh0IiBzej0iMjM4NiIgdD0iMTMzMzQ5NDg4MjYyNTQx?=
 =?us-ascii?Q?NzY5IiBoPSJzSnhXQ20yS0ZCd3pORFZyV0lXWHQ3T21JSVU9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFONFBBQURK?=
 =?us-ascii?Q?Y2Q0dXA4RFpBU1VVOGY1akV3cGNKUlR4L21NVENsd1pBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFCdUR3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUVCQUFBQUk3cVRwQUNBQVFBQUFBQUFBQUFBQUo0QUFBQmhBR1FBWkFC?=
 =?us-ascii?Q?eUFHVUFjd0J6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdNQWRRQnpBSFFBYndCdEFGOEFjQUJs?=
 =?us-ascii?Q?QUhJQWN3QnZBRzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFZd0IxQUhNQWRBQnZBRzBBWHdCd0FHZ0Fid0J1QUdVQWJnQjFB?=
 =?us-ascii?Q?RzBBWWdCbEFISUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCakFIVUFj?=
 =?us-ascii?Q?d0IwQUc4QWJRQmZBSE1BY3dCdUFGOEFaQUJoQUhNQWFBQmZBSFlBTUFBeUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-refone: =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR01B?=
 =?us-ascii?Q?ZFFCekFIUUFid0J0QUY4QWN3QnpBRzRBWHdCckFHVUFlUUIzQUc4QWNnQmtB?=
 =?us-ascii?Q?SE1BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVl3QjFBSE1BZEFCdkFHMEFY?=
 =?us-ascii?Q?d0J6QUhNQWJnQmZBRzRBYndCa0FHVUFiQUJwQUcwQWFRQjBBR1VBY2dCZkFI?=
 =?us-ascii?Q?WUFNQUF5QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFB?=
 =?us-ascii?Q?QUlBQUFBQUFKNEFBQUJqQUhVQWN3QjBBRzhBYlFCZkFITUFjd0J1QUY4QWN3?=
 =?us-ascii?Q?QndBR0VBWXdCbEFGOEFkZ0F3QURJQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFH?=
 =?us-ascii?Q?UUFiQUJ3QUY4QWN3QnJBSGtBY0FCbEFGOEFZd0JvQUdFQWRBQmZBRzBBWlFC?=
 =?us-ascii?Q?ekFITUFZUUJuQUdVQVh3QjJBREFBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VBQUFBWkFCc0FIQUFYd0J6QUd3?=
 =?us-ascii?Q?QVlRQmpBR3NBWHdCakFHZ0FZUUIwQUY4QWJRQmxBSE1BY3dCaEFHY0FaUUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reftwo: =?us-ascii?Q?QUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQmtBR3dBY0FCZkFI?=
 =?us-ascii?Q?UUFaUUJoQUcwQWN3QmZBRzhBYmdCbEFHUUFjZ0JwQUhZQVpRQmZBR1lBYVFC?=
 =?us-ascii?Q?c0FHVUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFB?=
 =?us-ascii?Q?QUFBQUFBQWdBQUFBQUFuZ0FBQUdVQWJRQmhBR2tBYkFCZkFHRUFaQUJrQUhJ?=
 =?us-ascii?Q?QVpRQnpBSE1BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFD?=
 =?us-ascii?Q?ZUFBQUFiUUJoQUhJQWRnQmxBR3dBWHdCd0FISUFid0JxQUdVQVl3QjBBRjhB?=
 =?us-ascii?Q?YmdCaEFHMEFaUUJ6QUY4QVl3QnZBRzRBWmdCcEFHUUFaUUJ1QUhRQWFRQmhB?=
 =?us-ascii?Q?R3dBWHdCaEFHd0Fid0J1QUdVQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCdEFHRUFjZ0Iy?=
 =?us-ascii?Q?QUdVQWJBQmZBSEFBY2dCdkFHb0FaUUJqQUhRQVh3QnVBR0VBYlFCbEFITUFY?=
 =?us-ascii?Q?d0J5QUdVQWN3QjBBSElBYVFCakFIUUFaUUJrQUY4QVlRQnNBRzhBYmdCbEFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVB?=
 =?us-ascii?Q?QUFBQUFBQUFBZ0FBQUFBQW5nQUFBRzBBWVFCeUFIWUFaUUJzQUY4QWNBQnlB?=
 =?us-ascii?Q?RzhBYWdCbEFHTUFkQUJmQUc0QVlRQnRBR1VBY3dCZkFISUFaUUJ6QUhRQWNn?=
 =?us-ascii?Q?QnBBR01BZEFCbEFHUUFYd0JvQUdVQWVBQmpBRzhBWkFCbEFITUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFB?=
 =?us-ascii?Q?QUNlQUFBQWJRQmhBSElBZGdCbEFHd0FiQUJmQUdFQWNnQnRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-rorf: true
x-dg-refthree: =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlB?=
 =?us-ascii?Q?QUFBQUFKNEFBQUJ0QUdFQWNnQjJBR1VBYkFCc0FGOEFad0J2QUc4QVp3QnNB?=
 =?us-ascii?Q?R1VBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHMEFZ?=
 =?us-ascii?Q?UUJ5QUhZQVpRQnNBR3dBWHdCd0FISUFid0JxQUdVQVl3QjBBRjhBWXdCdkFH?=
 =?us-ascii?Q?UUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VBQUFBYlFCaEFISUFkZ0JsQUd3QWJB?=
 =?us-ascii?Q?QmZBSEFBY2dCdkFHb0FaUUJqQUhRQVh3QmpBRzhBWkFCbEFITUFYd0JrQUdr?=
 =?us-ascii?Q?QVl3QjBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFB?=
 =?us-ascii?Q?SUFBQUFBQUo0QUFBQnRBR0VBY2dCMkFHVUFiQUJzQUY4QWNBQnlBRzhBYWdC?=
 =?us-ascii?Q?bEFHTUFkQUJmQUc0QVlRQnRBR1VBY3dCZkFHTUFid0J1QUdZQWFRQmtBR1VB?=
 =?us-ascii?Q?YmdCMEFHa0FZUUJzQUY4QWJRQmhBSElBZGdCbEFHd0FiQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUcw?=
 =?us-ascii?Q?QVlRQnlBSFlBWlFCc0FHd0FYd0J3QUhJQWJ3QnFBR1VBWXdCMEFGOEFiZ0Jo?=
 =?us-ascii?Q?QUcwQVpRQnpBRjhBWXdCdkFHNEFaZ0JwQUdRQVpRQnVBSFFBYVFCaEFHd0FY?=
 =?us-ascii?Q?d0J0QUdFQWNnQjJBR1VBYkFCc0FGOEFid0J5QUY4QVlRQnlBRzBBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reffour: =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFB?=
 =?us-ascii?Q?QUFiUUJoQUhJQWRnQmxBR3dBYkFCZkFIQUFjZ0J2QUdvQVpRQmpBSFFBWHdC?=
 =?us-ascii?Q?dUFHRUFiUUJsQUhNQVh3QmpBRzhBYmdCbUFHa0FaQUJsQUc0QWRBQnBBR0VB?=
 =?us-ascii?Q?YkFCZkFHMEFZUUJ5QUhZQVpRQnNBR3dBWHdCdkFISUFYd0JuQUc4QWJ3Qm5B?=
 =?us-ascii?Q?R3dBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCdEFHRUFjZ0IyQUdV?=
 =?us-ascii?Q?QWJBQnNBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQmZBRzRBWVFCdEFHVUFjd0Jm?=
 =?us-ascii?Q?QUhJQVpRQnpBSFFBY2dCcEFHTUFkQUJsQUdRQVh3QnRBR0VBY2dCMkFHVUFi?=
 =?us-ascii?Q?QUJzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFB?=
 =?us-ascii?Q?QUFBQUFBZ0FBQUFBQW5nQUFBRzBBWVFCeUFIWUFaUUJzQUd3QVh3QndBSElB?=
 =?us-ascii?Q?YndCcUFHVUFZd0IwQUY4QWJnQmhBRzBBWlFCekFGOEFjZ0JsQUhNQWRBQnlB?=
 =?us-ascii?Q?R2tBWXdCMEFHVUFaQUJmQUcwQVlRQnlBSFlBWlFCc0FHd0FYd0J2QUhJQVh3?=
 =?us-ascii?Q?QmhBSElBYlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNl?=
 =?us-ascii?Q?QUFBQWJRQmhBSElBZGdCbEFHd0FiQUJmQUhRQVpRQnlBRzBBYVFCdUFIVUFj?=
 =?us-ascii?Q?d0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ0QUdFQWNnQjJB?=
 =?us-ascii?Q?R1VBYkFCc0FGOEFkd0J2QUhJQVpBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFJQUFBQUFBQUFBQUFBQUFBRUFB?=
 =?us-ascii?Q?QUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg=3D=3D?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB5216:EE_|MN6PR18MB5442:EE_
x-ms-office365-filtering-correlation-id: 45929612-96bc-4fc9-daf9-08db8ebe536b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hN0N46cimgv1AU2SiSc+D4SrComDCA/Hm4GyuapT6pF4tSpNsCWIDUqP0k/b165zoMXfLQm7GtLoV/vtNoPoF5A3vp9g+tP0RcOSk9f2vyZlOVMK+BGVrHS5vYUdTu8S64caRu4D+fOkJ4eIOt9qFRxHwNakyMs6GZDW7haFb2Fw4xCiPux3+YHVHdI+lp6qg6ZUHUu1NWXsVYVXkddVjw2HUgdwUbFmfkIJv8YG29Ctv27s/fg+VNxtSB+7ts6fS6/0ynJfXQNzFybxZEpqvSd3V4H92ehJL5Tm2Rd2uDfcPq+1f4h8KElXC1xl5mJw4Vpf6DHdEbeczpqQI76WY66KHe7NaqyGRgv906eYqvWrJShHxDB/xI03rI947cFwzF8tPkacNANn0fnALhdIItdaFdKVxGPlhlzva3ZAl/aNJgglDce2U69tSKI8gLqD57iR30OscXG7Xnoo8nP9ve9jAWXIIiFN0BKkf9LbDneVIm1NPSeRAIQRaoTlDg3rBfzFU1HdSpCgs0EQi9+FUB2nDI/FSZLS0lL0tikFJcTqyHKpTqBnorlMJ/gG4wKRvnW+84z/XzR2M7zLaxBZNiAe1mNLdUAnLi7qmHcfh3DURk2uRJ0jiVZe6uFeD0cL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB5216.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(451199021)(316002)(26005)(6506007)(8936002)(41300700001)(8676002)(55016003)(33656002)(6916009)(122000001)(66446008)(64756008)(76116006)(66946007)(478600001)(66556008)(4326008)(66476007)(9686003)(71200400001)(7696005)(38100700002)(2906002)(38070700005)(83380400001)(86362001)(52536014)(186003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f300m2JLmiV0BFeFBVvcc6NrAj8kP6/aYEkq9BciSbZJUIPHc0ANWSup2oV6?=
 =?us-ascii?Q?nps+N3PQtKffHXwDsO5IkRgWwV5cLkZXhreW3Odl4YOeY7Wgp2l7YEG26iFl?=
 =?us-ascii?Q?Mz+Mx1QkUPOi6dDi5mmwL3XDgzQNIgHgUYjAh1vlQxKVNAZX3OluHobvPxRZ?=
 =?us-ascii?Q?FZINoacWDmKHOn3MSL6sYIUYOn9YkIvSssdT1vTbsKDTADSemBXQv9hBLm2Z?=
 =?us-ascii?Q?VeQ3wn+BTygQBvH9SkfOWYGt+sS7NjTfnLS1KkU0EhA82jGpw+HBHqjlGRA9?=
 =?us-ascii?Q?vDkcL6WGiB0ci+bbP+az7D1EUG1AyEk7KbWxww+Sk3cp9ultDObfMsupfSU+?=
 =?us-ascii?Q?1J7vC/2D8WeMvEpL7ocC8Em4shSDNqRt9EMhAymXsckiOKEsHPEzfwXvRnNV?=
 =?us-ascii?Q?Ya/uHye0ej0ejOvhsZTBowGVIS+M6RTZvHFHAQCjL9m3cXF5BSX7ATRnPENy?=
 =?us-ascii?Q?mnt3W/xfmuFU2ROgF3znpK5byuO+mQmq6rugbMg4x1eezqYcLUTWO8/SW4Gs?=
 =?us-ascii?Q?2GsQ0tTlBRvKcChLVNhMLC3S7a6O1bR+TeIFPJ4+ZYf0a6k0MD7HOwxx5IBQ?=
 =?us-ascii?Q?VoR9sf5jfHLInv8ERcVBhSkEn6b9Gak0i4alyzV+PIMA4F8zwWZuAgQv0BTL?=
 =?us-ascii?Q?Eq13BIeNf70nA6PrZm1Ij5tpfBLX2IlMt/7woYIFa0+GIJPBCfmhDnjk9G5u?=
 =?us-ascii?Q?1y010+UE34fxcYHlnA/Bmx5FP9H0dLvPp92kg/i42socRSiqTbE0REndg6UD?=
 =?us-ascii?Q?xG5LjjkXSDFgWMXMEPgMniLxz08TlugwV5YpjYpVgKdUklNJPB7LS5RWe64z?=
 =?us-ascii?Q?G+ilH8AZ751Nh1TLzBco7pVP/1gP+t6NjhAPqGuAFK6kp2uWZdxDqPIcW7KM?=
 =?us-ascii?Q?FHGAFAJRifVfnB9hwGh84zwjMXq5k10waxgOYD4FJvYnJ7bWG2SlHplImJ/1?=
 =?us-ascii?Q?cdPHfj/3cufcF3+jTb+OBYeoy3EztkBiCbh0NUPgTYMOOGjQzEQLysiL2Fwp?=
 =?us-ascii?Q?MU5a/glqvGhKiUacFJ7jZRYg3QNfVDttpC974MLjYkZ3ghe9G4N3pUY85JeZ?=
 =?us-ascii?Q?5vOL4H17YgZrAUEtzNaZBHZeU6mAC18oTAWeW1zibcNfqgp8FqUPTz7UbD23?=
 =?us-ascii?Q?Wo/oCI99Msr4w4tFoHGBxCm4xOTABE/NuQ+W0YMVddFRmH53LhQglF6ocYan?=
 =?us-ascii?Q?UDdEEar1SycEPdOKpB6LvSEkMdhUug8TY9iTdrQDQuAlOD0PK3G2SUG8Oxsj?=
 =?us-ascii?Q?hyoiDHt1r1LetvRqTdiZt2GwDsoA0TZkn3YvGTvwdwgGNzneRh81gZdiulEb?=
 =?us-ascii?Q?7nHwCEZZcYq+n5kWnygtiqQLWS7IVRrgxOHWZmgGkYT8OXeO4t4+C8cucgqA?=
 =?us-ascii?Q?oo+DwD7wkfvEbIWQxmzCsQJpLJ+G3Sdcd0gFzV7UNog+sL4py98ymtYHNwaV?=
 =?us-ascii?Q?At1gDcJjGNhcOXW4lFa33BJUcgM3i0GQJ7KPBTnwgp6MlJMxgTAZLpI0Wwci?=
 =?us-ascii?Q?c1vFiGov3FdNzGTyK/DMe7nT5oa9KRXCAu3P/5ua2eOU28OJpABSeJP+0mj4?=
 =?us-ascii?Q?FLqIu7uC5ZscPVRlcUxbTs0tBbx5/qlVAEKK/A+F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB5216.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45929612-96bc-4fc9-daf9-08db8ebe536b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 16:27:09.7005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mK1eV/EmrUw3vEpEuXZDhqPAhJGTHjFWMnZABINfFSMuV7faEire7ekwscUfE6agjFuCnrhBOShOGmcjpJ2IrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5442
X-Proofpoint-GUID: OECe-yv6wDOvjWBweqVzbtVyL03929Zz
X-Proofpoint-ORIG-GUID: OECe-yv6wDOvjWBweqVzbtVyL03929Zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>Hello Suman Ghosh,
>
>The patch ec87f05402f5: "octeontx2-af: Install TC filter rules in
>hardware based on priority" from Jul 21, 2023 (linux-next), leads to the
>following Smatch static checker warning:
>
>	drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:860
>otx2_tc_update_mcam_table_del_req()
>	error: uninitialized symbol 'cntr_val'.
[Suman] Hi Dan,
I will push a patch fixing the same.
>
>drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
>    837 static int otx2_tc_update_mcam_table_del_req(struct otx2_nic
>*nic,
>    838                                              struct
>otx2_flow_config *flow_cfg,
>    839                                              struct otx2_tc_flow
>*node)
>    840 {
>    841         struct list_head *pos, *n;
>    842         struct otx2_tc_flow *tmp;
>    843         int i =3D 0, index =3D 0;
>    844         u16 cntr_val;
>    845
>    846         /* Find and delete the entry from the list and re-
>install
>    847          * all the entries from beginning to the index of the
>    848          * deleted entry to higher mcam indexes.
>    849          */
>    850         list_for_each_safe(pos, n, &flow_cfg->flow_list_tc) {
>    851                 tmp =3D list_entry(pos, struct otx2_tc_flow,
>list);
>    852                 if (node =3D=3D tmp) {
>    853                         list_del(&tmp->list);
>    854                         break;
>    855                 }
>    856
>    857                 otx2_del_mcam_flow_entry(nic, tmp->entry,
>&cntr_val);
>
>otx2_del_mcam_flow_entry() looks like it can fail.
>
>    858                 tmp->entry++;
>    859                 tmp->req.entry =3D tmp->entry;
>--> 860                 tmp->req.cntr_val =3D cntr_val;
>    861                 index++;
>    862         }
>    863
>    864         list_for_each_safe(pos, n, &flow_cfg->flow_list_tc) {
>    865                 if (i =3D=3D index)
>    866                         break;
>    867
>    868                 tmp =3D list_entry(pos, struct otx2_tc_flow,
>list);
>    869                 otx2_add_mcam_flow_entry(nic, &tmp->req);
>    870                 i++;
>    871         }
>    872
>    873         return 0;
>    874 }
>
>regards,
>dan carpenter

Return-Path: <kernel-janitors+bounces-4390-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4E91CABE
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 04:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE71AB2237B
	for <lists+kernel-janitors@lfdr.de>; Sat, 29 Jun 2024 02:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B8B1CFA9;
	Sat, 29 Jun 2024 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UHJhIsrh"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431B1C680;
	Sat, 29 Jun 2024 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719629937; cv=none; b=UMk052t4ldHsUD7Zm8Xi0/3yV3XgLqCd7Z7eoFei/e6z8euc9WrdP7Sez7gAKB9Aco1NleCfG3dzfs1Ibb9nN/CAjgEYw79PitaMVBzxaYPeAEaBaAtdpTmea14xbupXBixSxMOC/KrV/Q6CsmIb6jWYHQxLjjHujiDMKiL585s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719629937; c=relaxed/simple;
	bh=m3/0vYI54mGz7/Dzn5hbGf8pSja+RMZ0LBwhizwqyAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l9cTBtL0Hxwv7WLXPtR0EiBmNXyTD+Dv6N2Ny8WLpKAH6AtFzw1ml+5lhGPdDlbkNhz/xCVgBU/R2+PB9zXThc0WtrXcg72ijlS2WryOejcSxrWidQJErHTRjVcJp691YP0JBcny9bffslUsbTl8WJsT/CN+1yDJ/gQPiou/3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UHJhIsrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45T2rC7F023684;
	Sat, 29 Jun 2024 02:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQfgZe6/GCNA9V1HoJvB1KXG7NV6877JA09g5N7lir0=; b=UHJhIsrhK+w09l3s
	xzkInV4gimdxW7jl0/5490h7xUgkFmF/61DI/TG8hJ57wfxYP32MCkIZi/BtSy6i
	UuyoElpqC+a1mlerk2nvOsgoAVKKvXWYZ2Z25+tiDjpCywypXI+2uz8T+Y+g1bx6
	ke9JfrNNfSi/Vxpgmk36Zn50As3vMtU9G9L1tIJee+fEJkl678PbxeaAXUE3m9Zk
	0YwViRujgWnR+6J0OnbSNy1+k+fsFyuACsdo9lOQw1qE7xKI8C+YAhkmhQ0eruq0
	lv66Q5135kxUw8u0UeOHKhWuoJ0pjdf5TtnDFQngIQs0ZLQBLcyb99fD0EvqklGP
	szLqzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yf05pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 02:58:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45T2wpIR027903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 02:58:51 GMT
Received: from [10.48.245.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 19:58:50 -0700
Message-ID: <58029cca-22fd-424d-ab5a-f9be4524029d@quicinc.com>
Date: Fri, 28 Jun 2024 19:58:49 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/zlib: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20240613-md-csky-lib-zlib_deflate-v1-1-83504d9a27d6@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240613-md-csky-lib-zlib_deflate-v1-1-83504d9a27d6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -xFiBYiu6Y_ezXkdLZj0mQCO8Q_yzGHK
X-Proofpoint-ORIG-GUID: -xFiBYiu6Y_ezXkdLZj0mQCO8Q_yzGHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=895 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290021

On 6/13/2024 10:01 PM, Jeff Johnson wrote:
> With ARCH=csky, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  lib/zlib_deflate/deflate_syms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/zlib_deflate/deflate_syms.c b/lib/zlib_deflate/deflate_syms.c
> index 24b740b99678..68941a2350ea 100644
> --- a/lib/zlib_deflate/deflate_syms.c
> +++ b/lib/zlib_deflate/deflate_syms.c
> @@ -17,4 +17,5 @@ EXPORT_SYMBOL(zlib_deflate);
>  EXPORT_SYMBOL(zlib_deflateInit2);
>  EXPORT_SYMBOL(zlib_deflateEnd);
>  EXPORT_SYMBOL(zlib_deflateReset);
> +MODULE_DESCRIPTION("Data compression using the deflation algorithm");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240613-md-csky-lib-zlib_deflate-54aa437cc89d

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff


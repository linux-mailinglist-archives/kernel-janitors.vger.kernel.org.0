Return-Path: <kernel-janitors+bounces-7672-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692ECA7A220
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Apr 2025 13:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F451894519
	for <lists+kernel-janitors@lfdr.de>; Thu,  3 Apr 2025 11:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F2C24C069;
	Thu,  3 Apr 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqVpCI2m"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3093597B
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Apr 2025 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680828; cv=none; b=SlHSAL904iEgM/KeH3TmOq0H9n5lt/gVqtRkWCDui/JbhBnGW0vQ+u8CoBRhgQweUrSzt9P0Xz3wOvJya1Gt4HC7NVK5JfQwvIHrivTWwcedCDl8yWuHYOOgACmhsxy7jShIUiYVAa0Nuw8EYDzg/3eNYKwnzoVbQSjhMfPpxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680828; c=relaxed/simple;
	bh=bVCLsaxLXWbChut3pmQ9NWbwS6gpz4qyTGWJxKtSsVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8QLTvtrcQQ+ZzHQA9eMx8O9LiS/kEjWol41OjtxspqMsbKrqeqFmBX1uREYzRlUR+zFYDNz60W1l3HcOQYuvpEFi/HEcfpdv3fuPXEpJo+d5WvX+D7kC5M6DbyvhFR0RKA+KIOaJYMFr+ePaYDZgCmAGRJvprB/NB4d17oF+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqVpCI2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s9o9025753
	for <kernel-janitors@vger.kernel.org>; Thu, 3 Apr 2025 11:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGDDQ0jFQhPbqbOdDbGahC5H
	PEzlI0t4a/oQTJyUEaA=; b=MqVpCI2mqWZp8Lj0wC0y/WMu8WD/S5b1LcuxFpno
	GEwxvFPt8DgXb+0YAkVXre9vkPId3PV4Jj5tYfd1vDK0rhZL/eg0ad99GpaJw165
	uJW0nya9aAYvd7tHD4UrVgohOn9M3fJi6IIN2ybVM9Sh5RZniPcklh8bUXUD+y77
	C9cDQYwcxme3wepARo9Q4lvoBRGaJJQcuFz6GE399d0IzUSUJUkbySk63ZDh0Xa/
	2hZA6ccQj6EpAUiLzy2wA6kuqVUDWaxUZxsuu52UF7Qnp5+Fe00I4rTsb++kQynB
	mmv5SAiFi6WITFVZvGzPUTh8E+n6po2sJJZCaa6o+f91gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadvwnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 03 Apr 2025 11:47:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so131361285a.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Apr 2025 04:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680825; x=1744285625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGDDQ0jFQhPbqbOdDbGahC5HPEzlI0t4a/oQTJyUEaA=;
        b=CJIInE0JBSnjMN2sqJEZT0+6oB6Vo5BlDeZxto0ffuVcOL1ZtDuGKToiCRH6qYScMc
         L9/cmP829Vh/NQy4AAsAHe6KIsNxDbUI5IDKkB2REuGrPEDUMympNbZROv9P09JVXZrm
         WOC+XbK9L3VMo/p4W/NcFVEnzCIkH6wXLKLgzjP3cZdr+Ch6jGaXkCyXXTkvAOOtjGz/
         cj3O45CXiFe2XiEF1jSeb1ipAwNaSep4VGxUamxsZ4wqdYqRca+zYJ7Oy9Rij+Eo5KU8
         e1QxH8EswPX4WLdEAsvKtP70P1m3Y9SaxH9cxfx4z/fEPqS7ak0h7sxsF/i14rnJG0Sc
         TFnw==
X-Forwarded-Encrypted: i=1; AJvYcCWBOayxoqyVTzabkEKZqf5z8ATd2fgvjE1admQtvr2CFbISym8KOfv30jfmB/wF8pByz6UvgD0PAN3ZTvoBeSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyW66od6pmlfccDBF9E6V1vD+REy8TSzw1E/y1PCfHF/kUyRmk
	Om2e4icR3fRzqGo3jzRt/QP9guYEKPWuL2koaDCp9zRT5UAeJ5Lipca3R2C+KxiDFOinX4uwF6s
	PtQINlIhPDt19voSTe4DiSabCkYNcF6WOtKt+fCpuZiMoaQ/pRec/O0aND1jRF7UBJAQ=
X-Gm-Gg: ASbGncsKsErMN9aKpcy7+2nGgkfpDT90/I+Uf2sZtxNX4vbfAKJY9XgYgDcms/9FYLw
	qDd2ZoGB/N4tFCRud0Vh9NVGXEZZsCfwE6Tx+0+ipUsB2DHX3Ie3LXgRJj8pTfrSqEyUtTRx+qa
	/cylKhVF2s4mdvrbvAA5HrJiL/ATLtA2kYQ+9H/giWFKEXgn85Ryucn9o5oC2FKWTRcFYG38/OR
	o7EHygwpPsusCyl7fEP/m4kH+SG0pmvQAaVA9kAXD+J4tOYvoixm2Uh87Z6vhvWulF7wGQE9dUa
	bhUJJlk5V51lz0CMC0teko4OlPUn1Iwe3n73dqr0/8yyoJqwXXldc5rE2x7fnfUOlm1IHk/Hfs0
	1xQ0=
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231438685a.16.1743680825054;
        Thu, 03 Apr 2025 04:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvB3vmejuvkvpwELxt6ofgBobQEqwcfxb76F9Sa70Rld/6kujkTtCtv4H2O+UpMOZfBwLcHg==
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231436585a.16.1743680824698;
        Thu, 03 Apr 2025 04:47:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab9easm134722e87.38.2025.04.03.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:47:02 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:46:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <3zxqrofeg6b4xewituh3aesixmlirwuy5mvzng74y7srr57i26@xw2w3rvwk2pg>
References: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ee753a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-lOYY9mtbGAmBqhMW_wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nm9y7A2fVX6Xy8kjN-AE_IiLi0gzlj3U
X-Proofpoint-GUID: Nm9y7A2fVX6Xy8kjN-AE_IiLi0gzlj3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030048

On Wed, Apr 02, 2025 at 01:59:51PM +0300, Dan Carpenter wrote:
> The device_del() call matches with the device_add() but we also need
> to call put_device() to trigger the qcom_iris_release().
> 
> Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This patch is based on static analysis and has not been tested.  Please
> review carefully, etc.  Another option would be to call device_unregister()
> 
>  drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


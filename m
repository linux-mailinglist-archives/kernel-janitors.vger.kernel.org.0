Return-Path: <kernel-janitors+bounces-8446-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C1AEC403
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Jun 2025 03:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53F7188F9A2
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Jun 2025 01:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEF81D63F0;
	Sat, 28 Jun 2025 01:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GScHrxCq"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C52F1FF1
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Jun 2025 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075929; cv=none; b=BGy6OTXNuP96tb54O/KcM/Drq7o0TZA46sLz0PE2wwENE0qhO5MywQPZDnF+ME0YVkdVVtwFx8bSwZFoDjEDUQbiYGAmOnBIeUby3Me6XXaNKedugy6RvUrDPJ4NrcVCLqpiXrQPXjJ9xbV2sUWo2oyQ7hEy5BnG7FbgV1MdYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075929; c=relaxed/simple;
	bh=d9LKJBFIUYg9q3j4nrEfRvvtZVZljnjssJcrM+FyHus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrluJ6cmThoCDxSntbgj8Ek58e9tM0U/5C33Srtf6IcPCJ/Yp29n0Bjesedn+WVdHi2NqfIA6T+4h5gRdV/p6VD6ow7JK47JXsZ8RcQ2wg1CImXkrwYU2Msk03IMM0JznHkKqDQerW/KmjJa2Eiisiw4kxHrfozpx3Q2zl9cnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GScHrxCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DL1p011045
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Jun 2025 01:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eILDFaNaizkjDCv06c5JedL2
	Rc8EWoy8Yse02GiZCR4=; b=GScHrxCqgi9tyxBX6Eo06duCyR9cRm9KEoKX4rqs
	ATXdTfow8eA/ycegO2ld6PxL1Pqw33JVI2dAq/OI8GKRIWIUHrEeIghZmHKSn5qN
	qn/fgLcSw4EIux1UsJ7nw+cGz3X42wN8tOkMunrfDl7iXTmNgXRdb1uhKfJxVtkQ
	u9TutO5Qj+mMYJKrZqzrcli/wecZETmhounHe10uNZhPKT8DJ8G2d5szjm7miMVZ
	QXH01B2l1YL2WECZ3rrmgmY5r465MH8k6c75xcDO0AKiws15Dc53Hnl2nbYsriac
	Eb8AmGwlQSp+23XM4PYk+q3lw/Q9AUDk27BiOrqPhDqzWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg4yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Jun 2025 01:58:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso418793685a.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 18:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075926; x=1751680726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eILDFaNaizkjDCv06c5JedL2Rc8EWoy8Yse02GiZCR4=;
        b=XbSG94CPyclBWlFuv3jNy5m45SJCFIvMiSAc9WV144GBkp3C22iqZlkrDbHxiAeyEj
         x8gdMkHwnIvG/s+cZXgz1yVoyNUrp6ZhPrZesMWmQio7OLozDlUEnOs4MrKk1fG7sQeP
         4jUcuvqaLFZKFMcy0CioDkhqgwV5FsQtPIxTWxXaNe6oHpYy+zpuhgnvvCuWpPeS7SOc
         BtxmdduMp0QSzO87zuG4U2/mCDcThDssOrmh3LdxHqsOW+9csCzPWxZeCEGPi/lhA8EG
         XcFqJsOfTWzk2gj9nBv686zOVCNtwfdJBDl/rcydnHKm58coCQFVFwtqWVge1pWWf0L9
         KB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjapiGr/mRhNQfYkQc6v15pytJkBQiab6NTUJLjjLWViUNBKWkgvK9rDbQfu+ITTntMJDKVY6MJWGyHquOukE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPbP0CgsD7W7OZNZiQvYBUR1J84PH7PsXWzx0zxODMVhndFgk
	CreUt/yfJoo5CdX5e5I5xVNxT+O37nfg16r8pAjUx6kVxI/0i+x3pBIxkKiWqQSiCl5b/qtihN/
	ffTdo2hHnfJbji6tx641vmxKuYUMTDzm7P7rhWTsHgW5xNXwAAr2Ops9anPJaDZPm2mUXnT0=
X-Gm-Gg: ASbGncv+OZ8leq0lMhH1hovjbKCOXuGBnOm4WGBdEkyM44R9lor4wLITywzLkWZnjTN
	E0g2qiEvWRs7y/mEhS07yUNqnUrO7I4/oMbYOH1vLxaKquuRsYNrAfYe7CcbmEaT8z/0+kod2NM
	1Xa6U8x+uqbcHVCFtQJAwzrFPUka+9/cVX0t/E3LgLa2YnRrSmPGgfSulqebyZxGBdZiPjGJXfp
	I3Vv5SRZQPck0FrHbG+FjZOpBKvHCvOX+kEmM0sX8w84dQypH0xYTLpJGhgDj8R+5sxXP2vm9Y+
	t2hO7nxp7n48Fi/Lf57cvgC/m+yTPaK6xxUb+NVschKnap05pS2gB+TQL/7mB2Ej7JCx2SLWG8e
	4R5Gz0p5DlYaVNcRP1HvVtuafer+hUKDYocM=
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id af79cd13be357-7d443909ecemr804970485a.1.1751075926138;
        Fri, 27 Jun 2025 18:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe6lwj3S9nIkZY7XE5bY0HRz69nnX1UC0J0DFAUuThqtRm1AXCajgP7n99Gm5BwELT8jCm7Q==
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id af79cd13be357-7d443909ecemr804968785a.1.1751075925765;
        Fri, 27 Jun 2025 18:58:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f2532sm630248e87.252.2025.06.27.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:58:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
Message-ID: <tszvojm35xaq3fqx4kbpqh2wa5l5mk33yldsis3wkw2b4f3jc5@gok3fhryt52v>
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX3YamtXrtZqzY
 GpTAa2Nt9+mhIiprUJzQ4S11vI1PqDtdwpE+OMPz+Td3UEmkXUHmtN/6gsVvfUZUvj6H6g8Gots
 AA2sPECVTTwM+yDAAlV8oxRdtOm0aNkTtkJ2RXTddLgxyGBOZdl5kipgebGbziLrDBxo/C/Kgk0
 o6VpSrYCmBwtueSrL3Cr34R56r7aCSim9qdtYm9RIqNI7JfMLJ11KFLiubpzZJxYDgQDEhL/xon
 2mcCjekmXhx8WA7fbaEpFQfyv6Li/ipDD0wDNNj9jQ8qmsHHI/EslJaGccyapzBfyu4ZCMt9EiI
 zj2fZdYE8Z9Let2iacwkpbg1Beqpw9FQILohA6C7gzOTEUT31XD3iA/RPemfd8LwmtuQcLURPNN
 1vWA0gCZtI8DtXg44w+fCLkRk0Vi8Slaun51yVCfa+zn2Xu6HQc5x1OWj2oonqFi3giacaqd
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f4c57 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=z0jYOjsfy6L0UbeeUVAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: e16-e4qznziFsaXV7fmB1zDVNCgoKZ5A
X-Proofpoint-ORIG-GUID: e16-e4qznziFsaXV7fmB1zDVNCgoKZ5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 07:18:03PM +0200, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The change has been done with:
>    sed -i s/mpd4/mdp4/g *
> and the modified files have been compile tested.
> 
> Maybe the comment "/* TODO: do we need different pll in other cases? */" in
> mpd4_lvds_pll_init() can be removed as well.
> A similar comment was removed in mdp4_lcdc_encoder_init() in commit
> 9c2f63da6a70 ("drm/msm/mdp4: register the LVDS PLL as a clock provider")
> 
> This has been waiting in my own tree for years, and popped-up recently
> because of other changes in the same area.
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 38 +++++++++----------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


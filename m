Return-Path: <kernel-janitors+bounces-6660-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDCB9E8FAB
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Dec 2024 11:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A549D282FD2
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Dec 2024 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA28216E0C;
	Mon,  9 Dec 2024 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOBzPojp"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B472215066
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Dec 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738771; cv=none; b=Zn8pByQNRUxaZDBwGEEl20+Oxo8TkgcQTeRggwry2c50MfCxTKjuSxBKbUWrrEg5WRW3IWjSWxqU8NJR6ileJI5B1aWmJ+0ijpvynsRpolyV3noGp+DZKs9ZeTuINwf4Jk1BPlJ1rFs3cKLCFssZhQ2TIIBYzb8n+IjzyKyRNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738771; c=relaxed/simple;
	bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eU5jIZvIwvzODiWzPSqh5h33YfAhK+w+cV0HCAd/c2/gzg8fk5jg54J/ygqdN7fc4yQtXNoVVjlxL45CtkCEgIv3Y23h8YtI8eloRTbQjlRsd7Ih7f6NP1NfO/Ge38Z4SUdF1kv1w6USGsFVC+mKBsIJFPzoTA0N7JOT3h8WC5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HOBzPojp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434e9716feaso9453735e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Dec 2024 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738766; x=1734343566; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
        b=HOBzPojp3ZD1huZ3EJKekpDzGQk8HG8IJGKVWHcRE6AidUjTcFcENE07Xd7VjLorn8
         5B90C6lseTDnpadr8+Vuy/kXY/GkJAz8SCsAIXod6PAKc2NnfxbNcln/keqohgPNrAhc
         TxixAlQ9X/m8gOyKZGnmnHgUzk2Va1J12TmBtcYEViVznNjv+Glt8WcP5ceJUwb7PTSK
         kD7hWG7Lb4eeYpsDI+g6PK5i9+z6O8c8JAEMsjJf0uBX014I2XMfcIhv272LFDjs5U1N
         nRMJzoHo6I9gIxLhbhMAwWPDiWnrGGsnceM+OdIx2MZnkGB3DAH9HRdQWuYISSozOrGF
         PpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738766; x=1734343566;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
        b=HK55lymPqQl9vtavINdLAB3fXsGCSs5p4KRSJ9ELOuYOZD4uONzVcirl4u2jdSHA2b
         pzypf2yLr789U/TacwfdVGFKoEmmZ0jxK6YDUv9tul+dSbq2As3ee4cKftHFKT/WHvNw
         yqjwlqxLofB8JveFuSfIlRBfJ++BTBIYL3gYOZQf82UadlRdOPm8zvQPvinSoWReYvGY
         RNGRRPoqyha0pEC4pccKpO5J6Hptrohe3H9ko3gPCYIdrtm410wflHEZv0tT07D/fOva
         hHCpmXojjfq979+2Ik7e0cuWJx9oQRsSmnui1S1O+Ma1pn1jbrB+cfWCuayyGokt1Xqp
         QbBA==
X-Forwarded-Encrypted: i=1; AJvYcCVG9Z4+8VT2JCPRaQADzaOKYN5I9Z6ItctVVU83lX44qHyUYpqSsWG8hiLJM6A+pa6FxNbrp+Qb8UOp2NsN2/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxly8TX5pAR94MdxR9YOG4fyEKqe35UWEiD98awxhzlcGSLMmeT
	xAWyYwyt0do2ZOt/lBZbl3g496/g6LHJ2e5coHfk7oB85SzxiT8He2i9vHDbyGk=
X-Gm-Gg: ASbGnctisceU9tjJz0Dg7KeyqfFoSAOAFfZZcp4ogIQkGti7A3ae5YwwWjUqwgs4c7M
	zBvz25O9PJcvM6uBbyxokJ3tmkGKYEs1AnyvaYh0VK1REzUTuWMAMEGhTW6YJmsi8htn3I4xwWI
	EgIH5k5f+GodBxcX13p0HY2x4lhQdQgS1ynf6oEXowmsmQ4qM2bZAVS1V1JRBCFtGx/CUc7XLp+
	reVAY/aOB7KA+PuFFT1KqvRcpqqb4JAKfJXNZVgGa31HDtIO96xyg==
X-Google-Smtp-Source: AGHT+IGJPbrzOuK2a05dvm0F4dtdPq0Y/T2pAGQw1YzQ1ka2ok+Y6aOk+x+gp+whelzTQDnBCo2xjA==
X-Received: by 2002:a05:600c:4fc9:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-434ddeb53b9mr109539965e9.10.1733738766502;
        Mon, 09 Dec 2024 02:06:06 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f19023d1sm64250965e9.20.2024.12.09.02.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:06:06 -0800 (PST)
Message-ID: <cac8862fff16a9f1d4ba59371a226759ad9b71cb.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: fix error code in
 max_contaminant_read_resistance_kohm()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>, Badhri Jagan Sridharan
	 <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Mon, 09 Dec 2024 10:06:05 +0000
In-Reply-To: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
References: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-12-06 at 16:09 +0300, Dan Carpenter wrote:
> If max_contaminant_read_adc_mv() fails, then return the error code.=C2=A0=
 Don't
> return zero.
>=20
> Fixes: 02b332a06397 ("usb: typec: maxim_contaminant: Implement check_cont=
aminant callback")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


